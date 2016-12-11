class UsersController < ApplicationController

  def index
    @users = []
    @users = User.search(params[:first_name], params[:last_name])
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end
  end

end
