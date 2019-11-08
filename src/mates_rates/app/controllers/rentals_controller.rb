class RentalsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :user_check, only: [:show]
  
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
    
    pp "Yeet"
    pp params

    @tool = Tool.find(params[:tool_id])

    @rental = current_user.rentals.new(rental_params)

    @rental.tool = Tool.find(params[:tool_id])

    @rental.calculate_fee(current_user)

    days = (@rental.end_date - @rental.start_date).to_i

    @rental.price = (@rental.tool.price * days)

    # if @rental.save
    #   puts "We Yeeting"
    # else
    #   puts "Sad bois"
    # end


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
    if @rental.start_date <= Time.now + 1.day 
      @rental.destroy
      respond_to do |format|
        format.html { redirect_to '/profile', notice: 'Rental was successfully deleted.' }
        format.json { head :no_content }
      end
    else 
      format.html { redirect_to @rental, notice: 'It\'s too late to cancel this rental.' }
    end
  end

  def tools
    @future_rentals = Rental.where(status == 'future')

  end


  def edit
    @rental = Rental.find(params[:id])

    if can? :edit, @rental
      @rental
      @unavailable_dates = @rental.tool.unavailable_dates
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @rental = Rental.find(params[:id])
    if can? :edit, @rental
      @rental
    else
      redirect_to('/browse', notice: 'You do not have permissions to view that page.')
    end
  end

  def index
    if current_user.has_role?(:admin)
      @rentals = current_user.rentals
    else
      redirect_to('/browse', notice: 'You do not have permissions to view that page.')
    end
  end



  private

  def user_check
    redirect_to browse_path unless Rental.find(params[:id]).user == current_user 
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :delivery_option, :price, :delivery_fee)
  end

end
