# == Schema Information
#
# Table name: ingredients
#
#  id            :bigint           not null, primary key
#  display_name  :string
#  icon_url      :text
#  name_hiragana :string
#  name_kanji    :string
#  name_katakana :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :ingredient do
    name { "MyString" }
    icon_url { "MyText" }
  end
end
