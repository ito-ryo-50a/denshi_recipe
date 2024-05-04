FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "Alice#{n}@example.com" }
    sequence(:nickname) { |n| "Alice#{n}" }
    password { "password" }
    password_confirmation { "password" }
  end
end
