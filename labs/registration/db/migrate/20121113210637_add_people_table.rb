class AddPeopleTable < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.timestamps
    end
  end
end
