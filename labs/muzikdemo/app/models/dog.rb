class Dog < ActiveRecord::Base
  mount_uploader :song, MusicUploader
end
