class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @profile.user = current_user
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    redirect_to dashboard_path
  end

  def edit
    @profile = Profile.find(params[:id])
    @profile.user = current_user
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.user = current_user
    @profile.update(profile_params)
    redirect_to dashboard_path
  end

  private

  def profile_params
    params.require(:profile).permit(:profile_picture, :first_name, :last_name, :address)
  end
end
