class WelcomeController < ApplicationController
  def index
    @profiles = Profile.all
    gon.allProfiles = Map.new.get_welcome_markers(@profiles)
    @frameworks = Profile.all_frameworks
  end
end
