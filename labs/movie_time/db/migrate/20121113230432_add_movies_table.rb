class AddMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :year
      t.string :rated
      t.string :runtime
      t.timestamps
    end
  end
end
