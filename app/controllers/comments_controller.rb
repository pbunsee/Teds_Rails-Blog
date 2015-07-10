class CommentsController < ApplicationController

  def index
    @comments = Comment.all.reverse
  end

  def show
    puts "@post.inspect is :  #{@comment.inspect}"
    puts "params.inspect is :  #{params.inspect}"
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Post.find(@post.id).comment.new
    flash[:notice] = "Saved Comment"
  end

  def create
    @comment = current_user.comments.create params[:comment]
    flash[:notice] = "Saved Comment"
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:notice] = "Removed Comment"
    @comment.destroy
    redirect_to comments_path
  end

  def edit
    @comment = Comment.find(params[:id])
    flash[:notice] = "Updated Comment"
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update params[:comment]
    flash[:notice] = "Updated Comment"
    redirect_to edit_comment_path
  end
end
