# == Schema Information
#
# Table name: ingredients
#
#  id            :bigint           not null, primary key
#  display_name  :string
#  icon_url      :text
#  name_hiragana :string
#  name_kanji    :string
#  name_katakana :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Ingredient < ApplicationRecord
  validates :name_hiragana, presence: true, uniqueness: true
  validates :name_katakana, presence: true, uniqueness: true
  validates :name_kanji, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true

  def self.search_by_name(query)
    where('name_hiragana LIKE :q OR name_katakana LIKE :q OR name_kanji LIKE :q', q: "%#{query}%")
  end
end
