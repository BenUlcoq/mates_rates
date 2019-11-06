class RentalsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
   @tool = Tool.find(params[:tool_id])
   @rental = @tool.rentals.new
   @user = @tool.user
   @unavailable_dates = @tool.unavailable_dates
  end

  def create
    @rental = current_user.rentals.new(rental_params)
    @rental.tool = Tool.find(params[:tool_id])

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



  def edit
    @rental = Rental.find(params[:id])
    @unavailable_dates = @rental.tool.unavailable_dates
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def index
    @rentals = current_user.rentals
  end



  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

end
