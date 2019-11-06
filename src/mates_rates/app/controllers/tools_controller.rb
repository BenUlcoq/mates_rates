class ToolsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def new
    @tool = Tool.new(tool_params)
  end

  def create
    # if @tool.save

  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def index
    @tools = Tool.all
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
    params.permit(:id, :price, :name, :brand, :model, :description, :availability, :delivery_options, :delivery_fee, :min_delivery_fee, :user_id)
  end


end
