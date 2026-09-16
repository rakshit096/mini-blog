class UsersController < ApplicationController
  before_action :require_user, only: [ :show, :destroy ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    current_user.destroy
    session[:user_id]=nil

    redirect_to articles_path, notice: "Logged out successfully"
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
