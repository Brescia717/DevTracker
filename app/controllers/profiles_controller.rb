class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @profile = @user.profile unless @user.profile.nil?
  end

  def create
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit!
    end
end
