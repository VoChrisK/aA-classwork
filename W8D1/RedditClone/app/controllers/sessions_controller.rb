class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by_credentials(username, password)

    if user
      login(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    logout
  end


end
