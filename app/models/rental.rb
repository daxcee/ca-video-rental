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

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :video
end
