class AddMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.decimal :gross
      t.timestamps
    end
  end
end
