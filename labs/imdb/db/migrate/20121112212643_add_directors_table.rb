class AddDirectorsTable < ActiveRecord::Migration

  def change
    create_table :directors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.timestamps

    end
  end
end
