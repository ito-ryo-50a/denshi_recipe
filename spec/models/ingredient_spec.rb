# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  icon_url   :text
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
