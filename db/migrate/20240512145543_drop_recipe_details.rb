class DropRecipeDetails < ActiveRecord::Migration[7.1]
  def up
    drop_table :recipe_details
  end

  def down
    create_table :recipe_details do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :cooking_steps
      t.text :description, null: false
      t.timestamps
    end
  end
end
