class AddAnimalsTable < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :photo
      t.timestamps
    end
  end
end
