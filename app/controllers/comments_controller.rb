class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    # @user = User.find(session[:user_id])
    # @posts = @user.find(@user.id).posts
  end

  def show
    puts "session user_id is :  #{session[:user_id]}"
    puts "session.inspect is :  #{session.inspect}"
    #puts "@user.inspect is :  #{@user.inspect}"
    puts "@post.inspect is :  #{@comment.inspect}"
    #@user = User.find(session[:user_id])
    #@posts = @user.find(@user.id).posts
    puts "params.inspect is :  #{params.inspect}"
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create params[:comment]
    # session[:post_id] = @post.id
    flash[:alert] = "Created Comment #{@comment.body}"
    redirect_to comment_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:alert] = "Comment #{@comment.id} - destroy action"
    @comment.destroy
    redirect_to comment_path
  end

  def edit
    @comment = Comment.find(params[:id])
    flash[:alert] = "Comment #{@comment.id} - edited action"
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update params[:comment]
    flash[:alert] = "Comment #{@comment.id} - update action"
    redirect_to edit_comment_path
  end
end
