class WelcomeController < ApplicationController
  def index
    gon.allProfiles = Map.new.get_welcome_markers
  end
end
