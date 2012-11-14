class AddMoviesTable < ActiveRecord::Migration #Migration is a Class inside a Module ActiveRecord
  
  def change # when you want to change table it's "up" but don't really need up/down methods, change works fine
    create_table :movies do |t|
      t.string :name # database column types can be found here: http://guides.rubyonrails.org/migrations.html in section 1.4
      t.text :description
      t.decimal :gross
      t.string :rating
      t.integer :tickets_sold
      t.timestamps 
    end
  end
  
end
