FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email("user_#{n}") }
    password "password"
    password_confirmation { password }
    name ""

    trait :with_twitter_account do
      after(:create) do |user|
        create(:user_account, :twitter, user: user)
      end
    end
  end
end
