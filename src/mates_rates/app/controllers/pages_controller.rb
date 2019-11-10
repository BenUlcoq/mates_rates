class PagesController < ApplicationController


  before_action :authenticate_user!, except: [:home, :results, :search, :redirect_to_results]

  
  def admin
    if current_user.has_role? :admin
      @tools = Tool.all
      @rentals = Rental.all
      @users = User.all
      @categories = Category.all
    else
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  def home
    @tools = Tool.last(12)
  end

  def profile

  end

  def search

  end

  def my_tools
    if can? :create, Tool
      @tools = Tool.where(user_id: current_user.id)
    else
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  def my_rentals
    @rentals = current_user.rentals
    @past = []
    @future = []
    @current = []

    @rentals.each do |rental|
      if rental.end_date < Date.today
        @past << rental
      elsif rental.start_date > Date.today
        @future << rental
      else 
        @current << rental
      end
    end

  @renting = []
  current_user.tools.each do |tool|
    @renting << tool
  end

  @past_rentals = []
  @future_rentals = []
  @current_rentals = []

  unless @renting.empty?
   @renting.each do |tool|
      tool.rentals.each do |rental|
        if rental.end_date < Date.today
          @past_rentals << rental
        elsif rental.start_date > Date.today
          @future_rentals << rental
        else 
          @current_rentals << rental
        end
      end
    end
  end

end

  def results
    pp params
    @query = params[:query]
    if @query
      @tools = Tool.search(params[:query])
    else
      redirect_to browse
    end
  end

  def redirect_to_results
    redirect_to results_path(params[:query])
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end

  def admin_check
    return false unless current_user.has_role? :admin
  end


end
