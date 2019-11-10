class RentalsController < ApplicationController
  
  # Ensures the user is logged in before performing actions
  before_action :authenticate_user!
  
  # Logic for passing data to new rental page
  def new
  # Grabs the relevant tool from the database.
   @tool = Tool.find(params[:tool_id])

  # Checks delivery settings for the tool to populate the select field in the form.
  # Rentals require one specific delivery method, tools with both available need to be formatted.
   if @tool.delivery_options == 'Both'
    # Formats the data for the select field
      @delivery_options = ['Delivery', 'Pickup']
   else 
    # If it's not Both we can juse the delivery option from the Tool itself.
    @delivery_options = [@tool.delivery_options]
   end

  #  Initialize the new rental
   @rental = @tool.rentals.new
  #  Calls the calculate fee method which determines delivery cost based on distance between users and delivery price
   @rental.calculate_fee(current_user)
  #  Stores the owner of the tool being rented as an instance to pass to the view.
   @user = @tool.user
  #  Calls the unavailable dates method to calculate dates which can't be picked.
   @unavailable_dates = @tool.unavailable_dates
  end

  # Rental Creation Logic
  def create
    # Grabs the relevant tool
    @tool = Tool.find(params[:tool_id])
    # Initializes the rental for the current user
    @rental = current_user.rentals.new(rental_params)
    # Sets the tool which the rental belongs to
    @rental.tool = @tool
    # Calculates the delivery fee - although done already we only want to store the ACTUAL delivery fee. Users are sly.
    @rental.calculate_fee(current_user)
    # Pickups dont have a delivery fee.
    if @rental.delivery_option == 'Pickup'
      @rental.delivery_fee = 0
    end

    # Gets the total number of days for the rental
    days = (@rental.end_date - @rental.start_date).to_i
    # Calculates the price - although handled by JS, we only want to store the ACTUAL price based on dates. Users are sly.
    @rental.price = (@rental.tool.price * days)

    # Logic for how to proceed depending on validation of rental
    respond_to do |format|
      if @rental.save
        # Attributes were allowed - rental is saved.
        format.html { redirect_to @rental, notice: 'Your rental has been approved!' }
        format.json { render :show, status: :created, location: @rental }
      else
        # Attributes were not allowed - rental is not saved, try again user.
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # Logic for cancelling rentals
  def destroy

    # Grabs the relevant rental
    @rental = Rental.find(params[:id])
    # Rentals less than 24 hours away can't be cancelled - company policy.
    if @rental.start_date > Time.now + 1.day 
      # Cancel the rental
      @rental.destroy
      # Redirect to profile and show success message.
      respond_to do |format|
        format.html { redirect_to '/profile', notice: 'Rental was successfully deleted.' }
      end
    else 
      # Rental start is too close - can't delete, redirect.
      redirect_to(@rental, alert: 'It\'s too late to cancel this rental.')
    end
  end

  # Update Rental Method
  def update
    # Grabs the relevant rental
    @rental = Rental.find(params[:id])
    # Checks whether the rental has already been set to complete by the tool owner.
    if update_returned[:returned] == "1"
      # Update rental returned value.
      @rental.returned = true

      # Save the rental and let the user know.
      @rental.save
      redirect_to(@rental, notice: 'Rental Complete - payments will now be processed.')
    end
  end

  # Rental edit page logic
  def edit
    # Grab the relevant rental.
    @rental = Rental.find(params[:id])

    # Check what the user can do to the rental.
    if can? :delete, @rental
      @rental 

      # If rental updating functionality was finalised - unavailable dates would be passed through to the date picker.
      # @unavailable_dates = @rental.tool.unavailable_dates

    elsif can? :edit, @rental
      @rental
    else
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  # Logic for showing Rental page
  def show
    # Grab the relevant rental
    @rental = Rental.find(params[:id])
  # Check the user permissions
    if can? :read, @rental
      @rental
    else
      # Failed permission check redirect
      redirect_back(fallback_location: root_path, alert: 'You do not have permissions to view that page.')
    end
  end

  # Rental Index Page
  def index
    # Check permissions - no one gets to see rental details except admins.
    if current_user.has_role?(:admin)
      # No need for a rentals index, redirect to the admin dashboard.
      redirect_to("#{admin_dash_path}#rentals")
    else
      # Failed permissions check redirect
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  private

  # Sanitization of rental params for creation.
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :delivery_option, :price, :delivery_fee)
  end

  # Sanitization of updating returned status.
  def update_returned
    params.require(:rental).permit(:returned)
  end

end
