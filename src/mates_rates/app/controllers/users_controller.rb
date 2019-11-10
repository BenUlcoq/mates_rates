class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tools = Tool.where(user_id: params[:id])
  end
end
