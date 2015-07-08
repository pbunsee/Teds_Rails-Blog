class PostsController < ApplicationController

  def index
    @posts = Post.all
    # @user = User.find(session[:user_id])
    # @posts = @user.find(@user.id).posts
  end

  def show
    puts "session user_id is :  #{session[:user_id]}"
    puts "session.inspect is :  #{session.inspect}"
    #puts "@user.inspect is :  #{@user.inspect}"
    puts "@post.inspect is :  #{@post.inspect}"
    #@user = User.find(session[:user_id])
    #@posts = @user.find(@user.id).posts
    puts "params.inspect is :  #{params.inspect}"
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post]
    # session[:post_id] = @post.id
    flash[:alert] = "Created Post #{@post.title}"
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    flash[:alert] = "Post #{@post.id} - destroy action"
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    flash[:alert] = "Post #{@post.id} - edited action"
  end

  def update
    @post = Post.find(params[:id])
    @post.update params[:post]
    flash[:alert] = "Post #{@post.id} - update action"
    redirect_to edit_post_path
  end
end
