class PagesController < ApplicationController


  before_action :authenticate_user!, except: [:home, :results, :search]

  
  def admin
    if current_user.has_role? :admin
      @tools = Tool.all
      @rentals = Rental.all
      @users = User.all
      @categories = Category.all
    else
      redirect_to('/browse', notice: 'You do not have permissions to view that page.')
    end
  end

  def home
    @tools = Tool.last(12)
  end

  def profile

  end

  def search

  end

  def my_rentals
    @rentals = Rental.where(user_id: current_user.id)
    @past = []
    @future = []
    @current = []

    @rentals.each do |rental|
      puts "yeeting"
      pp rental
      if rental.end_date < Date.today
        @past << rental
      elsif rental.start_date > Date.today
        @future << rental
      else 
        @current << rental
      end
    end
  end

  def results
    pp params
    @query = params[:query]
    if @query
      @tools = Tool.search(params[:query])
    else
      redirect_to tools_path
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
