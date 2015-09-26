class Profile < ActiveRecord::Base
  belongs_to :user

  validates_format_of :website, with: /\A(?!http:\/\/|https:\/\/)/,
    message: ": Please exclude 'http://' or 'https://'"
  validates_uniqueness_of :website, :github, :linkedin, allow_blank: true
  validates_presence_of :desired_salary, :desired_hourly, :user_id
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip_code, presence: true, length: { is: 5 }

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{street_address}, #{city}, #{state}, #{zip_code}."
  end

  def self.search(search)
    search ? where('framework ILIKE ?', "%#{search}%") : all
  end

  def owner?(user)
    (user == self.user) ? true : false
  end

end
