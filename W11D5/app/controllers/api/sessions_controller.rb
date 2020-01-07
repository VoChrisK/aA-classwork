class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            sign_in(@user)
            render :show
        else
            render json: ["Invalid Credentials"], status: 422
        end
    end

    def destroy
        if signed_in?
            sign_out
            render json: {}
        else
            render json: ["404 not found"], status: 404
        end
    end
end
