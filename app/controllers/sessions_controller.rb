class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged out. See You Next Time!"
    redirect_to root_path
  end

  def create
    #session.clear
    username = params[:username]
    password = params[:password]

    @user = User.where(username: username).first
    puts "sessioncontroller @user.inspect is: #{@user.inspect}"

    if @user.nil?
       flash[:alert] = "Incorrect Credentials!"
       redirect_to root_path
    else
      if @user.password == password
        puts "sessioncontroller @user.id is: #{@user.id}"
        session[:user_id] = @user.id
        flash[:alert] = "Welcome!"
        redirect_to posts_path
      else
        flash[:alert] = "Incorrect Credentials!"
        redirect_to root_path
      end
    end
  end

end
