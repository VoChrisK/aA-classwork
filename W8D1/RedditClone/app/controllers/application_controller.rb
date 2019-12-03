class ApplicationController < ActionController::Base
  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token! 
  end

  def logout
    session[:session_token] = nil
    @current_user.reset_session_token!
    redirect_to new_session_url
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def is_moderator?
    moderator = Sub.find_by(user_id: current_user.id)
    redirect_to sub_url(params[:id]) unless moderator
  end
end
