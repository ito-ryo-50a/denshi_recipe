class RemoveIngredientIdFromRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipe_ingredients, :ingredient_id, :bigint
  end
end
