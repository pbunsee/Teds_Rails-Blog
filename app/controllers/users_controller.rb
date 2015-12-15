class UsersController < ApplicationController

  def index
   session.clear
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #if params[:user][:password] == params[:password_confirmation]
      user_for_db_hash = {:username => user_params[:username], :password => user_params[:password]}
      @user = User.new(user_for_db_hash)
      if @user.save
        # auto sign-in the user after sign-up
        session[:user_id] = @user.id

        @profile = Profile.create!({user_id: @user.id})
        flash[:notice] = "Created User #{@user.username}"
        redirect_to edit_user_profile_path(current_user, @profile)
      else
        flash[:alert] = "Something went wrong"
        redirect_to new_user_path
      end
    #end
  end

  def show
   session.clear
    @user = User.find(params[:id])
    @profile = Profile.where(user_id: @user.id).first
    flash[:notice] = "User #{@user.id} details"
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.username} edited"
  end

  def destroy
    # Allow the user to de-activate their account, hard delete must only be for admin
    @user = User.find(params[:id])
    flash[:alert] = "User profile #{@user.username} de-activated"
    #@user.destroy
    @profile = User.find(@user.id).profile
    profile_flux_hash = {:activated => false}
    @profile.update profile_flux_hash
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update params[:user]
    flash[:notice] = "User #{@user.username} updated"
    redirect_to edit_user_path
  end

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :password_confirmation
                                 )
  end
end
