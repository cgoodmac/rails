class AddStocksTable < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :quotes
      t.timestamps
    end
  end
end
