class AddIngredientsToColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :ingredients, :name, :string
    add_column :ingredients, :name_hiragana, :string
    add_column :ingredients, :name_katakana, :string
    add_column :ingredients, :name_kanji, :string
    add_column :ingredients, :display_name, :string
  end
end
