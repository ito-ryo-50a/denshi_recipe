# == Schema Information
#
# Table name: recipe_procedures
#
#  id         :bigint           not null, primary key
#  order      :integer          not null
#  procedure  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :bigint           not null
#
# Indexes
#
#  index_recipe_procedures_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#
require 'rails_helper'

RSpec.describe RecipeProcedure, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
