# == Schema Information
#
# Table name: occurrences
#
#  id         :integer          not null, primary key
#  start      :date
#  end        :date
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Occurrence do
  pending "add some examples to (or delete) #{__FILE__}"
end
