# == Schema Information
#
# Table name: songs
#
#  id     :integer          not null, primary key
#  title  :string(255)
#  artist :string(255)
#  album  :string(255)
#  genre  :string(255)
#  photo  :string(255)
#

class Song < ActiveRecord::Base

end
