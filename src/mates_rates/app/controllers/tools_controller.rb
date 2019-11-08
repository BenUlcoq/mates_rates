class ToolsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def new
    @tool = Tool.new
    
  end

  def create
    
    @tool = Tool.new(tool_params)

    params[:tool][:categories].each do |category|
      cat = category.to_i
      if cat.positive?
        @tool.categories << Category.find(cat)
      end
    end

    
    # @tool.price = params[:price].to_i
    # @tool.delivery_fee = params[:delivery_fee].to_i
    # @tool.min_delivery_fee = params[:min_delivery_fee].to_i
    # @tool.availability = !params[:availability].to_i.zero?
    @tool.photo.attach(tool_params[:photo])
    @tool.user = current_user
    

    pp @tool

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors.full_messages, status: :unprocessable_entity }
      end
    end

    # if @tool.save

  end

  def update
    @tool = Tool.find(params[:id])

    @tool.update(tool_params)

    respond_to do |format|
      if @tool.update(tool_params)
        params[:tool][:categories].each do |category|
          cat = category.to_i
          if cat.positive?
            @tool.categories << Category.find(cat)
          end
        end
        @tool.image.attach(tool_params[:image]) if tool_params[:image]
        format.html { redirect_to @tool, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    if can? :edit, Tool.find(params[:id])
      @tool = Tool.find(params[:id])
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def index
      @tools = Tool.all.where(availability: true)
    # if browse page
    #     @tools = Tool.all
    # elsif search page
    #     @tools = Tool.where(name/brand = search term)
    # elsif usertools page
    #     @tools = current_user.tools
    # elsif home page
    #     @tools = Tool.find last 12
    # elsif category browse page
    #  @tools = Tool.where(categories.include? category)
    # end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
  end

  private

  def tool_params
    params.require(:tool).permit(:id, :price, :name, :brand, :model, :description, :availability, :delivery_options, :delivery_fee, :min_delivery_fee, :user_id, :photo)
  end


end
