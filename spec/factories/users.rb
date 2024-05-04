FactoryBot.define do
  factory :user do
    seaquence(:email) { |n| "for#{n}@example.com" }
    seaquence(:nickname) { |n| "nickname#{n}" }
    password { "password" }
    password_confirmation { "password" }
  end
end
