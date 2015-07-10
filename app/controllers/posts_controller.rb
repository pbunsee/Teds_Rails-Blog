class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    puts "@post.inspect is :  #{@post.inspect}"
    puts "params.inspect is :  #{params.inspect}"
    @post = Post.find params[:id]
  end

  def new
    if current_user
      @post = Post.new
    else
      flash[:alert] = "Please login to create a post."
      redirect_to posts_path
    end
  end

  def create
    @post = current_user.posts.create params[:post]
    flash[:alert] = "Successfully created post" 
    redirect_to posts_path
  end

  def destroy
    # Provide this option to admin only - add checks in
    @post = Post.find(params[:id])
    flash[:alert] = "Post #{@post.id} - destroy action"
    @post.destroy
    redirect_to posts_path
  end

  def edit
    # allow the current_user to only edit their own posts
    @post = Post.find(params[:id])
    #@post = current_user.posts.find(params[:id])
    flash[:alert] = "Post #{@post.id} - edited action"
  end

  def update
    puts "Post.find(params[:id]).inspect #{Post.find(params[:id]).inspect}"
    puts "current_user.inspect #{current_user.inspect}"
    @post = Post.find(params[:id])
    puts @post.inspect
    if @post.user_id == current_user.id
       @post.update params[:post]
       flash[:alert] = "Post #{@post.id} - update action"
    else
       flash[:alert] = "You can only edit your own posts"
    end
    redirect_to edit_post_path
  end
end
