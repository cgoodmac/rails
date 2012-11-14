# == Schema Information
#
# Table name: apartments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rooms      :integer
#  rent       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Apartment < ActiveRecord::Base
  has_many :tenants
end
