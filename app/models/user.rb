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
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe
  has_many :comments, dependent: :destroy
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate  :validate_additional_email_format
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 20 }

  def bookmark(recipe)
    bookmark_recipes << recipe
  end

  def unbookmark(recipe)
    bookmark_recipes.destroy(recipe)
  end

  def bookmark?(recipe)
    bookmark_recipes.include?(recipe)
  end

  def owner?(object)
    id == object&.user_id
  end

  private

  def validate_additional_email_format
    return if email =~ /\A[^.](?!.*\.\.)[\w+\-.]+[^\.]@([\w\-]+\.)+[\w\-]{2,}\z/

    errors.add(:email, 'is invalid')
  end
end
