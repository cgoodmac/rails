class DropActorsTable < ActiveRecord::Migration
  def change
    drop_table :actors
  end
end
