class AddStocksUsersTable < ActiveRecord::Migration
  def change
    create_table :stocks_users, :id => false do |t|
      t.integer :stock_id
      t.integer :user_id
    end
  end
end

# no primary key in this table, no timestamps