class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 20, null: false, index: { unique: true }
      t.string :email,    limit:255, null: false, index: { unique: true }
      t.string :crypted_password,    null: false
      t.string :salt,                null: false

      t.timestamps                   null: false
    end
  end
end
