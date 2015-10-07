FactoryGirl.define do
  factory :user_account do
    user

    provider "twitter"
    uid "123545" # was "twitter-user-id"

    trait :twitter do
      provider "twitter"
    end
  end
end
