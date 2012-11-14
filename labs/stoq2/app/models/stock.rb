# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  symbol     :string(255)
#  quote      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ActiveRecord::Base
  has_and_belongs_to_many :users
end

# users must be plural