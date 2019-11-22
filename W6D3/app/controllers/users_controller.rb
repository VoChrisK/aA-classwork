class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: params
    else
      render json: user.errors.full_message
    end
  end

  def show
    user = User.find(params[:id])
    render json: params
  end

  def update
    user = User.find(params[:id])
    if user.save
      user.update(user_params)
      render json: user
    else
      render json: user.errors.full_message
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :controller, :action)
  end
end
