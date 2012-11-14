class FixMoviesTable < ActiveRecord::Migration

  def change
    remove_column :movies, :director_name
    add_column :movies, :rating, :string
    add_column :movies, :name, :string
  end

end
