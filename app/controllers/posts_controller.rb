class PostsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @posts = @user.find(@user.id).posts
  end

  def show
    @user = User.find(session[:user_id])
    @posts = @user.find(@user.id).posts
  end
end
