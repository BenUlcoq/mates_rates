class RentalsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
   @tool = Tool.find(params[:tool_id])

   if @tool.delivery_options == 'Both'
      @delivery_options = ['Delivery', 'Pickup']
   else 
    @delivery_options = [@tool.delivery_options]
   end

   @rental = @tool.rentals.new
   @rental.calculate_fee(current_user)
   @user = @tool.user
   @unavailable_dates = @tool.unavailable_dates

   pp @delivery_options
   pp @tool
  end

  def create
    

    @tool = Tool.find(params[:tool_id])

    @rental = current_user.rentals.new(rental_params)

    @rental.tool = @tool

    @rental.calculate_fee(current_user)

    if @rental.delivery_option == 'Pickup'
      @rental.delivery_fee = 0
    end

    days = (@rental.end_date - @rental.start_date).to_i

    @rental.price = (@rental.tool.price * days)


    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Your rental has been approved!' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.start_date > Time.now + 1.day 
      @rental.destroy
      respond_to do |format|
        format.html { redirect_to '/profile', notice: 'Rental was successfully deleted.' }
        format.json { head :no_content }
      end
    else 
      redirect_to(@rental, alert: 'It\'s too late to cancel this rental.')
    end
  end

  def tools
    @future_rentals = Rental.where(status == 'future')

  end

  def update
    puts params
    puts 'params'
    puts update_returned[:returned]
    puts 'returned'
  
    @rental = Rental.find(params[:id])
    if update_returned[:returned] == "1"
      @rental.returned = true
      if @rental.save
        redirect_to(@rental, notice: 'Rental Complete - payments will now be processed.')
      end
    end

  end


  def edit
    @rental = Rental.find(params[:id])

    if can? :delete, @rental
      @rental
      @unavailable_dates = @rental.tool.unavailable_dates
    elsif can? :edit, @rental
      @rental
    else
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  def show
    @rental = Rental.find(params[:id])
    if can? :read, @rental
      @rental
    else
      redirect_back(fallback_location: root_path, alert: 'You do not have permissions to view that page.')
    end
    end

  def index
    if current_user.has_role?(:admin)
      @rentals = current_user.rentals
    else
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :delivery_option, :price, :delivery_fee)
  end

  def update_returned
    params.require(:rental).permit(:returned)
  end

end
