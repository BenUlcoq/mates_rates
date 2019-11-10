class PagesController < ApplicationController

# Ensure the user is logged in before performing actions
  before_action :authenticate_user!, except: [:home, :results, :search, :redirect_to_results]

  # Admin Dashboard Logic
  def admin

    # Check admin role
    if current_user.has_role? :admin

      # Pass through instance variables to view.
      @tools = Tool.all
      @rentals = Rental.all
  
    else

      # Failed permission check redirect.
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')

    end
  end

  # Homepage Logic
  def home
    # Pass through instance variable of latest 12 tools to the homepage view.
    @tools = Tool.last(12)
  end

  # Profile Page connection - static page requires no data
  def profile
  end

  # Search Page Connection - static page requires no data
  def search
  end

  # User's Tool Overview Logic
  def my_tools
    # Checks the is an Owner
    if can? :create, Tool
      # Pass through their own tools as instance variable
      @tools = Tool.where(user_id: current_user.id)
    else
      # Failed Permissions check redirect
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
  end

  # User's Rental Overview Logic
  def my_rentals
    # Grabs all of the user's rentals
    @rentals = current_user.rentals

    # Initializes variables for filtering
    @past = []
    @future = []
    @current = []

    # Loop to store each rental in the necessary variable
    @rentals.each do |rental|
      # Checks for past rentals and stores
      if rental.end_date < Date.today
        @past << rental
      # Checks for future rentals and stores
      elsif rental.start_date > Date.today
        @future << rental
      # If not a past or future rental, is current rental so store it.
      else 
        @current << rental
      end
    end

    # Initialize Renting Tools Variable
    @renting = []
    # Loop through tools and store
    current_user.tools.each do |tool|
      @renting << tool
    end

    # Initialize variables for filtering
    @past_rentals = []
    @future_rentals = []
    @current_rentals = []

    # Checks for data
    unless @renting.empty?
      # Loops through each tool they are renting out
    @renting.each do |tool|
      # Loops through each rental each tool has
        tool.rentals.each do |rental|
          # Filters by date and stores
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

  # Search results logic
  def results
    # Stores the search term
    @query = params[:query]
    # Checks that the search term exists.

    if @query
      # Stores the tools that match the query calling the model method search.
      @tools = Tool.search(params[:query])
    else
      redirect_to browse
    end
  end

  # Method for handling search requests to enable pretty url
  def redirect_to_results
    redirect_to results_path(params[:query])
  end

end
