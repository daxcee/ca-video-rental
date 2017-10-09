# == Schema Information
#
# Table name: rentals
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  video_id          :integer
#  charge_identifier :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Rental, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
