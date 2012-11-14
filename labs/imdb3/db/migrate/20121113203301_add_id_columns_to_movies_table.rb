class AddIdColumnsToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :studio_id, :integer
    add_column :movies, :actor_id, :integer
    add_column :movies, :director_id, :integer
  end
end
