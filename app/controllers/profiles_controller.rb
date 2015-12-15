class ProfilesController < ApplicationController
  
  # create route is not yet defined - it is actually being done in users controller in user create method

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find params[:id]
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.where("user_id = #{params[:id]}")

    #pull the image from the specified url and set the user's avatar
    fname = params[:profile][:firstname]
    lname = params[:profile][:lastname]
    email = params[:profile][:email]
    pic = params[:photo_url]
    new_profile_hash = {:firstname => fname, :lastname => lname, :email => email, :photo => pic}
    @profile.update!(new_profile_hash)  #not working
    redirect_to edit_user_profile_path
  end

  def destroy
    @profile = Profile.find(params[:id])
    :profile.activated = false
    @profile.update params[:profile]
    redirect_to edit_user_profile_path
  end

end
