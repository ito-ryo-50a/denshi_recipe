# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  cooking_time :string
#  cuisine_type :string           not null
#  dish_type    :string           not null
#  name         :string           not null
#  number       :integer          not null
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
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_procedures, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, :recipe_procedures, allow_destroy: true
end
