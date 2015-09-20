FactoryGirl.define do
  factory :profile do
    summary  "This is an example summary."
    comments ""
    website  ""
    linkedin ""
    github   ""
    availability ""
    desired_salary "50k"
    desired_hourly "20"
    latitude    42.30776
    longitude   (-72.640499)
    street_address "292 1/2 South St."
    city "Northampton"
    state "MA"
    zip_code "01060"
    framework "Meteor"

    # association :user
  end
end
