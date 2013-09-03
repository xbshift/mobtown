# == Schema Information
#
# Table name: dance_classes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  price         :decimal(8, 2)
#  student_price :decimal(8, 2)
#  session_dates :string(255)
#  slug          :string(255)
#  category_id   :integer
#

require 'spec_helper'

describe DanceClass do
  pending "add some examples to (or delete) #{__FILE__}"
end
