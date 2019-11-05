class RentalsController < ApplicationController
  
  
  def new
    @rental = Rental.new
    @user = Tool.find(params[:tool_id]).user
    @tool = Tool.find(params[:tool_id])
    @renter = current_user
    @unavailable_dates = Rental.unavailable_dates
  end

  def create
    @rental = Rental.new(params)
    @tweet.user = current_user

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def edit
  end

  def show
  end

  def index

  end
end
