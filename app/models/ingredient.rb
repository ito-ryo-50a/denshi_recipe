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
class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
