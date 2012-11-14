class AddStudiosTable < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.decimal :budget
      t.text :address
      t.timestamps
    end
  end
end
