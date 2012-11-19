class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :song
      t.string :youtube

      t.timestamps
    end
  end
end
