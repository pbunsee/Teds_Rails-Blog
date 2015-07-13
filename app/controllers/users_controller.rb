class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:password_confirmation]
      puts "create params[:user][:username]  #{params[:user][:username]}"
      puts "create params[:user][:username]  #{params[:user][:password]}"
      puts "create params[:password_confirmation]  #{params[:password_confirmation]}"
      @user = User.create params[:user]
      session[:user_id] = @user.id
      puts "session[:user_id] value is: #{session[:user_id]}"
      puts "@user.id value is: #{@user.id}"
      user_hash = {:user_id => @user.id}
      puts "user_hash user_id value is : #{user_hash[:user_id]}"
      puts "user_hash value is : #{user_hash}"
      @user.build_profile
      @profile = Profile.create(user_hash)
      #need to change this to something like current_user.profile.create
      puts " ahahahahahahahaha Profile.find(@profile.id) #{Profile.find(@profile.id)}"
      flash[:notice] = "Created User #{@user.username}"
      redirect_to edit_user_profile_path(current_user, @profile)
    else
      flash[:alert] = "Confirmation password does not match password"
      redirect_to new_user_path
    end
  end

  def show
    puts "show session user_id:  #{session[:user_id]}"
    puts "show params.inspect #{params.inspect}"
    puts "show params[:id]  #{params[:id]}"
    @user = User.find(params[:id])
    @profile = Profile.where(user_id: @user.id).first
    puts "show profile params.inspect #{@profile.inspect}" 
    puts "show profile @profile.firstname:  #{@profile.firstname}"
    puts "show profile @profile.lastname:  #{@profile.lastname}"
    puts "show profile @profile.email:  #{@profile.email}"
    puts "show @user.username:  #{@user.username}"
    puts "show @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    flash[:notice] = "User #{@user.id} details"
  end

  def edit
    @user = User.find(params[:id])
    puts "edit @user.username:  #{@user.username}"
    puts "edit @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    flash[:notice] = "User #{@user.username} edited"
  end

  def destroy
    # Allow the user to de-activate their account, hard delete must only be for admin
    @user = User.find(params[:id])
    puts "destroy @user.username:  #{@user.username}"
    puts "destroy @user.password:  #{@user.password}"
    flash[:alert] = "User profile #{@user.username} de-activated"
    #@user.destroy
    @profile = User.find(@user.id).profile
    puts "BEFORE UPDATE @profile.inspect #{@profile.inspect}"
    profile_flux_hash = {:activated => false}
    @profile.update profile_flux_hash
    puts "AFTER UPDATE @profile.inspect #{@profile.inspect}"
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    puts "update @user.username:  #{@user.username}"
    puts "update @user.password:  #{@user.password}"
    puts "users_path: #{users_path}"
    puts "user_path: #{user_path}"
    @user.update params[:user]
    flash[:notice] = "User #{@user.username} updated"
    redirect_to edit_user_path
  end

end
