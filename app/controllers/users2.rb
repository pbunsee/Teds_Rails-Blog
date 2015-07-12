class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:password_confirmation]
      puts "create #{params[:user][:firstname]}"
      puts "create #{params[:user][:lastname]}"
      puts "create #{params[:user][:email]}"
      puts "create #{params[:user][:username]}"
      puts "create #{params[:user][:password]}"
      puts "create #{params[:password_confirmation]}"
      @user = User.create params[:user]
      session[:user_id] = @user.id
      flash[:alert] = "Created User #{@user.username}"
      redirect_to posts_path
    else
      flash[:alert] = "Confirmation password does not match password"
      redirect_to new_post_path
    end
  end

  def show
    puts "show session user_id:  #{session[:user_id]}"
    puts "show params.inspect #{params.inspect}"
    puts "show params[:id]  #{params[:id]}"
    @user = User.find(params[:id])
    puts "show @user.firstname:  #{@user.firstname}"
    puts "show @user.lastname:  #{@user.lastname}"
    puts "show @user.email:  #{@user.email}"
    puts "show @user.username:  #{@user.username}"
    puts "show @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    flash[:alert] = "User #{@user.id} - show action"
  end

  def edit
    @user = User.find(params[:id])
    puts "edit @user.firstname:  #{@user.firstname}"
    puts "edit @user.lastname:  #{@user.lastname}"
    puts "edit @user.email:  #{@user.email}"
    puts "edit @user.username:  #{@user.username}"
    puts "edit @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    flash[:alert] = "User #{@user.id} - edit action"
  end

  def destroy
    @user = User.find(params[:id])
    puts "destroy @user.firstname:  #{@user.firstname}"
    puts "destroy @user.lastname:  #{@user.lastname}"
    puts "destroy @user.email:  #{@user.email}"
    puts "destroy @user.username:  #{@user.username}"
    puts "destroy @user.password:  #{@user.password}"
    flash[:alert] = "User #{@user.id} - destroy action"
    @user.destroy
    #session[:user_id] = nil  - allow the user to de-activate their account, hard delete must only be for admin
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    puts "update @user.firstname:  #{@user.firstname}"
    puts "update @user.lastname:  #{@user.lastname}"
    puts "update @user.email:  #{@user.email}"
    puts "update @user.username:  #{@user.username}"
    puts "update @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    @user.update params[:user]
    flash[:alert] = "User #{@user.id} - update action"
    redirect_to edit_user_path
  end

end
