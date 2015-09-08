class Map
  def get_welcome_markers
    profiles = Profile.all
    @arr = []
    profiles.each do |profile|
      if profile.user.name.nil?
        name = profile.user.email.gsub(/@+\w+.+\z/, '')
      else
        name = profile.user.name
      end
      @arr << { user_id: profile.user_id, name: name, summary: profile.summary, latitude: profile.latitude,
        longitude: profile.longitude }
    end

    @arr
  end

  def get_user_marker(user)
    profile = user.profile
    @arr = []
    if profile.user.name.nil?
      name = profile.user.email.gsub(/@+\w+.+\z/, '')
    else
      name = profile.user.name
    end
    @arr << { name: name, summary: profile.summary, latitude: profile.latitude,
      longitude: profile.longitude }

    @arr
  end
end
