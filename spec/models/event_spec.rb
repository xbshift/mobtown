# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  starts_at           :datetime
#  ends_at             :datetime
#  expiration          :datetime
#  special             :boolean
#  summary             :text
#  prose               :text
#  url                 :string(255)
#  photo_file_name     :string(255)
#  photo_content_type  :string(255)
#  photo_file_size     :integer
#  photo_updated_at    :datetime
#  slug                :string(255)
#  link                :string(255)
#  schedule            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  registration_switch :boolean
#  price               :decimal(8, 2)
#  student_price       :decimal(8, 2)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
