class WelcomeController < ApplicationController
  include ProfileHelper

  def index
    @profiles = Profile.all
    gon.allProfiles = Map.new.get_welcome_markers(@profiles)
    @frameworks = ProfileHelper.available_frameworks
  end
end
