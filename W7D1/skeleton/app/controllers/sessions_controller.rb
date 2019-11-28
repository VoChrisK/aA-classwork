class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:@user][:username], params[:@user][:password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end
end
