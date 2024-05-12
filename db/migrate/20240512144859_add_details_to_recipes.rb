class AddDetailsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :cuisine_type, :string, null: false
    add_column :recipes, :dish_type, :string, null: false
    add_column :recipes, :number, :integer, null: false
  end
end
