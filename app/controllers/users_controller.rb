class UsersController < ApplicationController

  def index
    @users = []
    @users = User.search(params[:first_name], params[:last_name])
  end

  def show
    @user = User.find(params[:id])
  end
end
