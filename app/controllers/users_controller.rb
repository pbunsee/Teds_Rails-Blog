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
      #@user = User.create params[:user]
      #user_for_db = user_params.delete :password_confirmation
      puts " user_params.inspect  is  #{user_params.inspect} "
      user_for_db_hash = {:username => user_params[:username], :password => user_params[:password]}
      @user = User.new(user_for_db_hash)
      if @user.save
        # auto sign-in the user after sign-up
        session[:user_id] = @user.id
        puts " session[:user_id] is  #{session[:user_id] }"

      puts "@user #{@user}  and @user.id #{@user.id}" 
      puts "current_user is #{current_user}"
      current_user.build_profile({:user_id => @user.id})
      current_user.profile.create
        # Create empty user_profile
        @user.build_profile
        @profile = Profile.create({:user_id => @user.id})
        #need to change this to something like current_user.profile.create

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

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :password_confirmation
                                 )
  end
end
