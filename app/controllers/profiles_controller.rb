class ProfilesController < ApplicationController
  
  # create route is not yet defined - it is actually being done in users controller in user create method

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def show
    puts "got here got here got here got here got here"
    @profile = Profile.find params[:id]
  end

  def edit
    @profile = Profile.find(params[:id])
    puts "@profile.inspect #{@profile.inspect}"
  end

  def update
    puts "WHAT ARE THE PARAMS INCOMING - params[:id]: #{params[:id]} "
    puts "WHAT ARE THE PARAMS INCOMING - params[:profile]: #{params[:profile]} "
    @profile = Profile.find(params[:id])
    puts "UPDATE @profile.inspect #{@profile.inspect}"
    @profile.update params[:profile]
    redirect_to edit_user_profile_path
  end

  def destroy
    puts "WHAT ARE THE PARAMS INCOMING - params[:id]: #{params[:id]} "
    puts "WHAT ARE THE PARAMS INCOMING - params[:profile]: #{params[:profile]} "
    @profile = Profile.find(params[:id])
    puts " activated value is: #{:profile.activated}"
    :profile.activated = false
    puts " activated value NOW is: #{:profile.activated}"
    puts "UPDATE @profile.inspect #{@profile.inspect}"
    @profile.update params[:profile]
    redirect_to edit_user_profile_path
  end

end
