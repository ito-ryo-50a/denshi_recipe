# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  cooking_time :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_recipes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :recipe do
    user { nil }
    name { "MyString" }
    cooking_time { "MyString" }
    publish_status { false }
  end
end
