class UsersController < ApplicationController

  # Passes through data relevant to the user.
  def show
    @user = User.find(params[:id])
    @tools = Tool.where(user_id: params[:id])
  end
end
