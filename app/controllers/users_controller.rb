class UsersController < ApplicationController
  def destroy
    current_user.destroy
    session[:user_id]=nil

    redirect_to articles_path, notice: "Logged out successfully"
  end
end
