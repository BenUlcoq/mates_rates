class ToolsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def new
    @tool = Tool.new
  end

  def create
    pp params
    @tool = Tool.new(tool_params)
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
