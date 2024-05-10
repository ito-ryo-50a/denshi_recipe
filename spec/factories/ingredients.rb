# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  icon_url   :text
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :ingredient do
    name { "MyString" }
    icon_url { "MyText" }
  end
end
