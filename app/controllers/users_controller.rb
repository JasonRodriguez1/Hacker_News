class UsersController < ApplicationController
  
  def index
    @users = Users.all
  end

private

  def users_params
    params.require(:name, :email, :user_name, :password).permit
  end
end