class AddPetsTable < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :species
      t.timestamps
    end
  end
end
