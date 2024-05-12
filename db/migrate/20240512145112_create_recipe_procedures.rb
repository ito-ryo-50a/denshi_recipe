class CreateRecipeProcedures < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_procedures do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :order, null: false
      t.text :procedure, null: false

      t.timestamps
    end
  end
end
