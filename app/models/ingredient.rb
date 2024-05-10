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
class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true
end
