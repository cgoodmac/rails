# == Schema Information
#
# Table name: creatures
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  weapon           :string(255)
#  password_digest  :string(255)
#  creature_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Creature < ActiveRecord::Base
  has_secure_password
  belongs_to :creature_type
  # has messages!
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
end
