class WelcomeController < ApplicationController
  include ProfileHelper

  def index
    @profiles = Profile.all
    gon.allProfiles = Map.new.get_welcome_markers(@profiles)
    @frameworks = ProfileHelper.available_frameworks

    respond_to do |format|
      format.js
      format.html
    end
  end
end
