class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @profile = @user.profile unless @user.profile.nil?
  end

  def new
    @profile = Profile.new

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = @user.id
    if @profile.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to current_user
    else
      flash[:error] = @profile.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def profile_params
      params.require(:profile).permit!
    end
end
