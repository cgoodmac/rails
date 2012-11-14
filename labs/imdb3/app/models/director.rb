# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ActiveRecord::Base
  has_many :movies
end
