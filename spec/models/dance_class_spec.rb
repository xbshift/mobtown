# == Schema Information
#
# Table name: dance_classes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string(255)
#

require 'spec_helper'

describe DanceClass do
  pending "add some examples to (or delete) #{__FILE__}"
end
