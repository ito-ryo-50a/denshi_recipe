# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  cooking_time :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_recipes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_detail, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  accepts_nested_attributes_for :recipe_detail, :recipe_ingredients, allow_destroy: true
end
