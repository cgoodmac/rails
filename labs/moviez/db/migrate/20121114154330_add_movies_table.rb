class AddMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.decimal :gross
      t.string :poster
      t.text :actors
      t.timestamps
    end
  end
end
