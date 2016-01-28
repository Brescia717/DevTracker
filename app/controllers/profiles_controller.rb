class ProfilesController < ApplicationController
  before_action :set_user, only: [:show]#, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @results    = Profile.search(params[:search])
    @map_data   = get_map_data(@results) # generates @map_data
    @frameworks = ProfileHelper.available_frameworks

    respond_to do |format|
      format.js
    end
  end

  def show
    @profile = @user.profile unless @user.profile.nil?
  end

  def new
    @profile = Profile.new
    @frameworks = ProfileHelper.available_frameworks
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @profile = Profile.find(params[:id])
    @frameworks = ProfileHelper.available_frameworks
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
      @user = User.find(params[:id])
    end

    def get_map_data(results)
      map_data = []
      results.each do |profile|
        map_data << {user_id: profile.user_id, id: profile.id,
          latitude: profile.latitude, longitude: profile.longitude,
          summary: profile.summary, framework: profile.framework,
          name: profile.user.user_tag }
      end
      map_data
    end

    def profile_params
      params.require(:profile).permit!
    end
end
