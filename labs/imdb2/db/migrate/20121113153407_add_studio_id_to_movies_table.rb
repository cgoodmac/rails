class AddStudioIdToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :studio_id, :integer

  end
end

#studio_id is a NECESSARY NAME, can't be anything else. Singular_id