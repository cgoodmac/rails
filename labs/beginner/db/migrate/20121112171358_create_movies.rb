class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.decimal :gross
      t.integer :tickets_sold
      t.string :rating
      t.date :release_date

      t.timestamps
    end
  end
end
