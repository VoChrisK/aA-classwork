class CommentsController < ApplicationController
  def index
    if params.has_key?(:search)
      output = User.where("username LIKE '%#{params[:search]}%'")
    elsif params[:user_id]
      output = User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      output = Artwork.find(params[:artwork_id]).comments
    else
      output = Comment.all
    end

    render json: output
  end

  def create
    comments = Comment.new(comments_params)
    if comments.save
      render json: comments
    else
      render json: comments.errors.full_messages, status: 422
    end
  end

  def destroy
    comments = Comment.find(params[:id])
    comments.destroy
  end

  private

  params = ActionController::Parameters.new({
    user: {
      search: ""
    } 
  })
  p params

  def comments_params
    params.require(:comments).permit(:user_id, :artwork_id, :body)
  end

  
end
