class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :zoom

      t.timestamps
    end
  end
end
