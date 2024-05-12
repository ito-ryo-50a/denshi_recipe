# == Schema Information
#
# Table name: recipe_ingredients
#
#  id              :bigint           not null, primary key
#  ingredient_name :string           not null
#  quantity        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recipe_id       :bigint           not null
#
# Indexes
#
#  index_recipe_ingredients_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#
require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
