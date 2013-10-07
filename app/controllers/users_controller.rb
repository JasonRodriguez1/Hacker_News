class UsersController < ApplicationController
  
  def index
    @users = Users.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

private

  def users_params
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation)
  end
end