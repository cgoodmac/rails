class RemoveActorIdFromMovies < ActiveRecord::Migration
  def up
    remove_column :movies, :actor_id
  end

  def down
    add_column :movies, :actor_id, :integer
  end
end
