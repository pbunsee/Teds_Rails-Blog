class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Sianara Sucker!"
    redirect_to root_path
  end
  
  def create
    username = params [:username]
    password = params [:password]

    @user = User.where(username: 'tjackson', admin: true).first

    if @user.nil?
      flash[:alert] = "Incorrect credentials"
      redirect_to root_path
    else
     if @user.password == password
       session[:user_id] = @user.id
       flash[:alert] = "Welcome!"


     else
      flash[:alert] = ""

    end
  end
end
