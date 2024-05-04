# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string           not null
#  email            :string(255)      not null
#  nickname         :string(20)       not null
#  salt             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_nickname  (nickname) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it "モデルのテストでニックネームがあれば有効な状態であること"
  it "モデルのテストでニックネームがなければ無効な状態であること"
  it "モデルのテストでニックネームが20文字ジャストであれば有効な状態であること"
  it "モデルのテストでニックネームが19文字であれば有効な状態であること"
  it "モデルのテストでニックネームが21文字以上であれば無効な状態であること"
  it "モデルのテストでメールアドレスがあれば有効な状態であること"
  it "モデルのテストでメールアドレスがなければ無効な状態であること"
  it "モデルのテストでメールアドレスが255文字ジャストであれば有効な状態であること"
  it "モデルのテストでメールアドレスが254文字であれば有効な状態であること"
  it "モデルのテストでメールアドレスが256文字以上であれば無効な状態であること"
  it "モデルのテストでパスワードがあれば有効な状態であること"
  it "モデルのテストでパスワードがなければ無効な状態であること"
  it "モデルのテストでパスワードが8文字ジャストであれば有効な状態であること"
  it "モデルのテストでパスワードが7文字であれば無効な状態であること"
  it "モデルのテストでパスワードが9文字以上であれば有効な状態であること"
end
