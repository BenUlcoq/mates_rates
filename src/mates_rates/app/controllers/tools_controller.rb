class ToolsController < ApplicationController

  # Ensure the user is signed in before allowing tool manipulation.
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def new
    # Authorisation - essentially checks for owner role.
    unless can? :create, Tool
      redirect_to('/browse', alert: 'You do not have permissions to view that page.')
    end
    # If authorised - intialize new tool.
    @tool = Tool.new
  end

  # Logic for creating Tool
  def create
    # Initialize the new tool
    @tool = Tool.new(tool_params)

    # Set categories based on categories selected
    params[:tool][:categories].each do |category|
      # Convert to integer
      cat = category.to_i
      
      # Rails checkbox collection select passes through blank value to help handle user input
      # So we check that the current iteration isn't this blank value.
      if cat.positive?
        # Assign and Store the category
        @tool.categories << Category.find(cat)
      end
    end

    # Attach the uploaded photo
    @tool.photo.attach(tool_params[:photo])
    # Assign the tool to the current user
    @tool.user = current_user

    # Description is allowed to be blank, but we don't want it to be nil.
    unless @tool.description
      @tool.description = ""
    end

    # Model is allowed to be blank, but we don't want it to be nil.
    unless @tool.model
      @tool.model = ""
    end
    
    # Logic for valid creation check
    respond_to do |format|
      if @tool.save
        # Create tool and store
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @tool }
      else
        # Errors - try again
        format.html { render :new }
        format.json { render json: @tool.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # Tool Update
  def update
    # Grab the relevant tool
    @tool = Tool.find(params[:id])

    # Logic for valid update check.
    respond_to do |format|
      if @tool.update(tool_params)
        # Get categories and update tool.
        params[:tool][:categories].each do |category|
          cat = category.to_i
          # Blank checkbox collection select value filtering
          if cat.positive?
            @tool.categories << Category.find(cat)
          end
        end
        # Update image if necessary.
        @tool.image.attach(tool_params[:image]) if tool_params[:image]
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # Logic for Tool editing
  def edit
    # Authorisation check
    if can? :edit, Tool.find(params[:id])
      # Grab the relevant tool
      @tool = Tool.find(params[:id])
    else
      # Failed permissions check redirect
      redirect_to('/browse', notice: 'You do not have permissions to view that page.')
    end
  end


  # Logic for showing Tool
  def show
    # Grab the relevant tool
    @tool = Tool.find(params[:id])
    # Initialize variable for filtering
    @tools = []

    # Finding related tools
    # Loop through the tool's categories
    @tool.categories.each do |category|
      # Loop through the current category's tools
      category.tools.each do |tool|
        # For each tool that is available, store.
        if tool.availability == true
          @tools << tool
        end
      end
    end

    # Make sure we've got enough tools, otherwise grab latest.
    if @tools.length < 4
      @tools = Tool.last(4)
    else
      @tools.uniq!.last(4)
    end
  end

  # Pass through all available tools to the index page.
  def index
      @tools = Tool.where(availability: true)
  end


  # Tools can't be destroyed because they are referenced by Rentals - that's why availability is an option.

  private

  # Sanitize tool creation params.
  def tool_params
    params.require(:tool).permit(:id, :price, :name, :brand, :model, :description, :availability, :delivery_options, :delivery_fee, :min_delivery_fee, :user_id, :photo)
  end


end
