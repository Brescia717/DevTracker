FactoryGirl.define do
  factory :user_account do
    user

    provider "twitter"
    uid "twitter-user-id"

    trait :twitter do
      provider "twitter"
    end
  end
end
