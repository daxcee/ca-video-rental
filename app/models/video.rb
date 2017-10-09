# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  name           :string
#  genre          :string
#  year_released  :integer
#  classification :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Video < ApplicationRecord
end
