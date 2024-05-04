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
  let (:user) { build(:user) }

  describe "モデルのバリデーションチェック" do

    context "nicknameが存在しているとき" do
      it "有効であること" do
        user.nickname = "Alice"
        expect(user).to be_valid
      end
    end

    context "nicknameがnilのとき" do
      it "無効であること" do
        user.nickname = nil
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:nickname]).to include("can't be blank")
      end
    end

    context "nicknameが20文字のとき" do
      it "有効であること" do
        user.nickname = "a" * 20
        expect(user).to be_valid
      end
    end

    context "nicknameが21文字のとき" do
      it "無効であること" do
        user.nickname = "a" * 21
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
      end
    end

    context "nicknameが重複しているとき" do
      it "無効であること" do
        create(:user, nickname: "Alice")
        user.nickname = "Alice"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:nickname]).to include("has already been taken")
      end
    end

    context "emailが存在しているとき" do
      it "有効であること" do
        user.email = "alice@example.com"
        expect(user).to be_valid
      end
    end

    context "emailがnilのとき" do
      it "無効であること" do
        user.email = nil
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context "emailが255文字のとき" do
      it "有効であること" do
        user.email = "a" * 243 + "@example.com"
        expect(user).to be_valid
      end
    end

    context "emailが256文字のとき" do
      it "無効であること" do
        user.email = "a" * 244 + "@example.com"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
      end
    end

    context "emailが重複しているとき" do
      it "無効であること" do
        create(:user, email: "alice@example.com")
        user.email = "alice@example.com"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("has already been taken")
      end
    end

    context "passwordが存在しているとき" do
      it "有効であること" do
        user.password = "password"
        user.password_confirmation = "password"
        expect(user).to be_valid
      end
    end

    context "passwordがnilのとき" do
      it "無効であること" do
        user.password = nil
        user.password_confirmation = nil
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:password]).to include("can't be blank")
      end
    end

    context "passwordが7文字のとき" do
      it "無効であること" do
        user.password = "a" * 7
        user.password_confirmation = "a" * 7
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end

    context "passwordが8文字のとき" do
      it "有効であること" do
        user.password = "a" * 8
        user.password_confirmation = "a" * 8
        expect(user).to be_valid
      end
    end

    context "passwordが確認用パスワードと一致しているとき" do
      it "有効であること" do
        user.password = "password"
        user.password_confirmation = "password"
        expect(user).to be_valid
      end
    end

    context "passwordが確認用パスワードと一致していないとき" do
      it "無効であること" do
        user.password = "password"
        user.password_confirmation = "wrongpassword"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end

    context "password_confirmationがnilのとき" do
      it "無効であること" do
        user.password = "password"
        user.password_confirmation = nil
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:password_confirmation]).to include("can't be blank")
      end
    end

    context "validate_additional_email_formatにマッチするパターン" do
      it "連続するドットが含まれるemailが無効であること" do
        user.email = "alice..alice@example.com"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("is invalid")
      end
      it "1文字目にドットが使用されているemailが無効であること" do
        user.email = ".alice@example.com"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("is invalid")
      end
      it "@の直前にドットが使用されているemailが無効であること" do
        user.email = "alice.@example.com"
        user.valid?
        expect(user).to be_invalid
        # expect(user.errors[:email]).to include("is invalid")
      end
    end
  end
end
