class Profile < ActiveRecord::Base
  validates_format_of :website, with: /\A(?!http:\/\/|https:\/\/)/,
    message: ": Please exclude 'http://' or 'https://'"
  validates_uniqueness_of :website, :github, :linkedin
  validates_presence_of :desired_salary, :desired_hourly, :user_id

  belongs_to :user
end
