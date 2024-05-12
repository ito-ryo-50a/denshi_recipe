class AddIngredientNameToRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :recipe_ingredients, :ingredient_name, :string, null: false
  end
end
