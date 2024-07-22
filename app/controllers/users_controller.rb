class UsersController < ApplicationController
  def index
    if params.has_key?(:name)
      render json: User.where("username LIKE ?", "%#{params[:name]}%")
    else
      render json: User.all
    end
  end

  def create
    user = User.new(users_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_content
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(users_params)
      render json: user
    else
      render user.errors.full_messages, status: :unprocessable_content
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def destroy

    # begin
      user = User.find(params[:id])
      user.destroy!
      render json: user
    # rescue
    #   render json: {message: "User Not Found"}, status: :unprocessable_content
    # end

  end

  private
  def users_params
    params.require(:user).permit(:username)
  end
end
