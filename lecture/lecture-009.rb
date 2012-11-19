# lecture-009.rb
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rake db:create
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rails g migration add_movies_table
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rake db:migrate

# g stands for generate

# rake db:rollback removes the last step. You can uncreate a table if that was the last thing you did

# nuke the whole database
# rake db:drop

# disconnect the database in pgAdmin first

# annotate files 
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > annotate
# Annotated (1): Movie

# access pry in rails: 
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rails c
# Loading development environment (Rails 3.2.8)
# [1] pry(main)> 

# m1 = Movie.new
# no initialize method in here needed, it goes up to parent ActiveRecord

# => #<Movie id: nil, name: nil, description: nil, gross: nil, rating: nil, tickets_sold: nil, created_at: nil, updated_at: nil>
# [2] pry(main)> m1.name = "Jaws"
# => "Jaws"
# [3] pry(main)> m1.description = "Super Scary!!!!"
# => "Super Scary!!!!"
# [4] pry(main)> m1.gross = 3_200_800
# => 3200800
# [5] pry(main)> m1
# => #<Movie id: nil, name: "Jaws", description: "Super Scary!!!!", gross: #<BigDecimal:10230a6f8,'0.32008E7',9(36)>, rating: nil, tickets_sold: nil, created_at: nil, updated_at: nil>

# NO ID YET. THAT MEANS NOT YET SAVED TO DB

# M1.SAVE # THIS SAVES TO DB. DOES THE SQL FOR YOU!

# [6] pry(main)> m1.save
#    (0.2ms)  BEGIN
#   SQL (100.7ms)  INSERT INTO "movies" ("created_at", "description", "gross", "name", "rating", "tickets_sold", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["created_at", Mon, 12 Nov 2012 21:12:23 UTC +00:00], ["description", "Super Scary!!!!"], ["gross", #<BigDecimal:103eebf20,'0.32008E7',9(36)>], ["name", "Jaws"], ["rating", nil], ["tickets_sold", nil], ["updated_at", Mon, 12 Nov 2012 21:12:23 UTC +00:00]]
#    (15.5ms)  COMMIT
# => true

# [7] pry(main)> Movie.create(:name => "Titanic")
# ActiveModel::MassAssignmentSecurity::Error: Can't mass-assign protected attributes: name
# from /usr/local/rvm/gems/ruby-1.9.3-p194/gems/activemodel-3.2.8/lib/active_model/mass_assignment_security/sanitizer.rb:48:in `process_removed_attributes'

# ADDED THIS LINE TO MOVIE.RB TO ENABLE ADDING:
# attr_accessible :name, :description, :gross, :rating, :tickets_sold


# NEED TO EXIT AND RUN IT AGAIN

# [8] pry(main)> exit
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rails c
# Loading development environment (Rails 3.2.8)
# [1] pry(main)> Movie.create(:name => "Titanic")
#    (0.2ms)  BEGIN
#   SQL (9.9ms)  INSERT INTO "movies" ("created_at", "description", "gross", "name", "rating", "tickets_sold", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["created_at", Mon, 12 Nov 2012 21:18:13 UTC +00:00], ["description", nil], ["gross", nil], ["name", "Titanic"], ["rating", nil], ["tickets_sold", nil], ["updated_at", Mon, 12 Nov 2012 21:18:13 UTC +00:00]]
#    (0.9ms)  COMMIT
# => #<Movie id: 2, name: "Titanic", description: nil, gross: nil, rating: nil, tickets_sold: nil, created_at: "2012-11-12 21:18:13", updated_at: "2012-11-12 21:18:13">

# TO POPULATE TABLE USE SEED FILE

# IN DB/SEEDS.RB: 

# Movie.create(:name => "Skyfall", :description => "James Bond", :rating => "NC-17")
# Movie.create(:name => "Goldfinger", :description => "James Bond", :rating => "G")
# Movie.create(:name => "James Bond I", :description => "James Bond", :rating => "PG-13")
# Movie.create(:name => "Bourne Ultimatum", :description => "Jason Bourne", :rating => "R")
# Movie.create(:name => "The Shining", :description => "Nicholson", :rating => "NC")

# THEN IN CONSOLE, EXIT AND TYPE RAKE DB: SEED
# ~/Dropbox/wdi/rails/labs/imdb ✗ master > rake db:seed

~/Dropbox/wdi/rails/labs/imdb ✗ master > rake db:seed
~/Dropbox/wdi/rails/labs/imdb ✗ master > rails g migration add_directors_table

# add_directors_table is superfluous, it's not important the name, just for you to see when you manage migration files

Add def change to add_directors_table
class AddDirectorsTable < ActiveRecord::Migration

  def change
    create_table :directors do |t|
      t.string :name
      t.integer :name
      t.string :gender
      t.timestamps
    end
  end
end

rake db:migrate

create director.rb in models

  # class Director < ActiveRecord::Base
  #   attr_accessible :name, :age, :gender

  # end

THEN

Annotate! to add the schema information

Just run "annotate" in terminal

THEN

Add stuff to the seed file

THEN IN CONSOLE, EXIT AND TYPE RAKE DB:SEED





