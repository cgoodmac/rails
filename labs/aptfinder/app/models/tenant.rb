# == Schema Information
#
# Table name: tenants
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  age          :integer
#  gender       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :integer
#

class Tenant < ActiveRecord::Base
  belongs_to :apartment
  has_many :pets
end
