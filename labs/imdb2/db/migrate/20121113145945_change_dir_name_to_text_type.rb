class ChangeDirNameToTextType < ActiveRecord::Migration
  def change
    change_column :movies, :director_name, :text
  end
end

#:table, :what you're changing, :aspect of column you're changing