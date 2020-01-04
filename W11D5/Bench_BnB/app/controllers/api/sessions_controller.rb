class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            sign_in(@user)
            render json: @user
        else
            render json: [error: "Invalid Credentials"], status: 422
        end
    end

    def destroy
        if signed_in
            sign_out
            render json: {}
        else
            render json: {error: "Something went wrong", status: 404}
        end
    end
end
