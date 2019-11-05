class RentalsController < ApplicationController
  
  
  def new
   @tool = Tool.find(params[:tool_id])
   @rental = @tool.rentals.new
   @user = @tool.user
   @unavailable_dates = @tool.unavailable_dates
  end

  def create
    rental = current_user.rentals.new(rental_params)
    rental.tool = Tool.find(params[:tool_id])
    rental.save
  end

  def edit
  end

  def show
  end

  def index

  end



  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

end
