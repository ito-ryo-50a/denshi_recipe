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
  let(:user) { build(:user) }

  it "モデルのテストでニックネームがあれば有効な状態であること" do
    user = User.new(nickname: "nickname")
    expect(user).to be_valid
  end

  it "モデルのテストでニックネームがなければ無効な状態であること" do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "モデルのテストでニックネームが20文字ジャストであれば有効な状態であること" do
    user = User.new(nickname: "a" * 20)
    expect(user).to be_valid
  end

  it "モデルのテストでニックネームが19文字であれば有効な状態であること" do
    user = User.new(nickname: "a" * 19)
    expect(user).to be_valid
  end

  it "モデルのテストでニックネームが21文字以上であれば無効な状態であること" do
    user = User.new(nickname: "a" * 21)
    user.valid?
    expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
  end

  it "モデルのテストでメールアドレスがあれば有効な状態であること" do
    user = User.new(email: "for@exemple.com")
    expect(user).to be_valid
  end

  it "モデルのテストでメールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "モデルのテストでメールアドレスが255文字ジャストであれば有効な状態であること" do
    user = User.new(email: "a" * 243 + "@example.com")
    expect(user).to be_valid
  end

  it "モデルのテストでメールアドレスが254文字であれば有効な状態であること" do
    user = User.new(email: "a" * 242 + "@example.com")
    expect(user).to be_valid
  end

  it "モデルのテストでメールアドレスが256文字以上であれば無効な状態であること" do
    user = User.new(email: "a" * 244 + "@example.com")
    user.valid?
    expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "モデルのテストでパスワードがあれば有効な状態であること" do
    user = User.new(password: "password")
    expect(user).to be_valid
  end

  it "モデルのテストでパスワードがなければ無効な状態であること" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "モデルのテストでパスワードが8文字ジャストであれば有効な状態であること" do
    user = User.new(password: "a" * 8)
    expect(user).to be_valid
  end

  it "モデルのテストでパスワードが7文字であれば無効な状態であること" do
    user = User.new(password: "a" * 7)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

  it "モデルのテストでパスワードが9文字以上であれば有効な状態であること" do
    user = User.new(password: "a" * 9)
    expect(user).to be_valid
  end
end
