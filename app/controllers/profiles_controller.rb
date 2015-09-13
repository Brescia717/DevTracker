class ProfilesController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @results = Profile.search(params[:search])
    get_map_data(@results)

    respond_to do |format|
      format.js
    end
  end

  def show
    @profile = @user.profile unless @user.profile.nil?
  end

  def new
    @profile = Profile.new
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

    def get_map_data(results)
      @map_data = []
      results.each do |r|
        @map_data << {user_id: r.user_id, id: r.id, latitude: r.latitude,
          longitude: r.longitude, summary: r.summary, framework: r.framework,
          name: (User.where(id: r.user_id).first.name || User.where(id: r.user_id).first.email) }
      end
      @map_data
    end

    def profile_params
      params.require(:profile).permit!
    end
end
