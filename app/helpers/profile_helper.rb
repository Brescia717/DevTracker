module ProfileHelper
  def self.available_frameworks
    ["Rails", "Meteor", "PHP", "Unspecified"]
  end

  def profile_summary
    @profile.summary.nil? ? "Coming soon!" : @profile.summary
  end

  def profile_framework
    @profile.framework.nil? ? "Unspecified" : @profile.framework
  end

  def profile_website
    @profile.website.nil? ? "" : ( link_to @profile.website,
                                   "http://#{@profile.website}" )
  end

  def profile_github
    @profile.github.nil? ? "" : ( link_to @profile.github,
                                  "http://#{@profile.github}" )
  end

  def profile_linkedin
    @profile.linkedin.nil? ? "" : ( link_to @profile.linkedin,
                                    "http://#{@profile.linkedin}" )
  end

  def profile_desired_salary
    @profile.desired_salary.nil? ? "not specified" : @profile.desired_salary
  end

  def profile_desired_hourly
    @profile.desired_hourly.nil? ? "not specified" : @profile.desired_hourly
  end
end
