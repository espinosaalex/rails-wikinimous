class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to articles_path
    else
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:user, :name, :email, :password, :password_confirmation)
  end
end
