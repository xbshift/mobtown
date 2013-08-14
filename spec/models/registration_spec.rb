# == Schema Information
#
# Table name: registrations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  amount_paid :decimal(8, 2)
#  how_paid    :string(255)
#  pass_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  void        :boolean          default(FALSE)
#

require 'spec_helper'

describe Registration do
  pending "add some examples to (or delete) #{__FILE__}"
end
