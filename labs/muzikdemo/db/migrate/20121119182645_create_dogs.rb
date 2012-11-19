class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :song
      t.string :youtube

      t.timestamps
    end
  end
end
