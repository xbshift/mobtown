# == Schema Information
#
# Table name: passes
#
#  id            :integer          not null, primary key
#  event_id      :integer
#  name          :string(255)
#  price         :decimal(8, 2)
#  available     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  limit         :integer
#  passable_id   :integer
#  passable_type :string(255)
#  session       :string(255)
#  archived      :boolean          default(FALSE)
#

require 'spec_helper'

describe Pass do
  pending "add some examples to (or delete) #{__FILE__}"
end
