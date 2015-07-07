class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      puts params[:firstname]
      puts params[:lastname]
      puts params[:email]
      puts params[:username]
      puts params[:password]
      puts params[:password_confirmation]
      @user = User.create params[:user]
      flash[:alert] = "Created User #{@user.username}"
      redirect_to users_path
    else
      flash[:alert] = "Confirm password does not match password"
    end
  end
end
