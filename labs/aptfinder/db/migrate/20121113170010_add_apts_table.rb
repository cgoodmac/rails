class AddAptsTable < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :name
      t.integer :rooms
      t.decimal :rent
      t.timestamps
    end
  end
end
