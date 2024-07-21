class CommentsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      render json: Comment.where(user_id: params[:user_id])
    else
      render json: Comment.where(artwork_id: params[:artwork_id])
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])

    if comment
      comment.destroy
      render json: comment
    else
      render json: {message: "Comment doesn't exist"}
    end
  end

  def create
    comment = Comment.new(comments_params)

    if comment.save
      render json: comment
    else
      render comment.errors.full_messages, status: :unprocessable_content
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
