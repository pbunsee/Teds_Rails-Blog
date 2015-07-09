class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    puts "session user_id is :  #{session[:user_id]}"
    puts "session.inspect is :  #{session.inspect}"
    #puts "@user.inspect is :  #{@user.inspect}"
    puts "@post.inspect is :  #{@comment.inspect}"
    puts "params.inspect is :  #{params.inspect}"
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Post.find(@post.id).comment.new
  end

  def create
    @comment = current_user.comments.create params[:comment]
    flash[:alert] = "Created Comment #{@comment.body}"
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:alert] = "Comment #{@comment.id} - destroy action"
    @comment.destroy
    redirect_to comments_path
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
