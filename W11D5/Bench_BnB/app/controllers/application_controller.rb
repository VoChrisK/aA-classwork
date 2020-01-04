class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :signed_in

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def sign_in(user)
        @current_user = user
        session[:session_token] = user.reset_token
    end

    def sign_out
        current_user.reset_token
        session[:session_token] = nil
    end

    def signed_in
        !!current_user
    end
end
