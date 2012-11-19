# How to drop a table

class DropActorsTable < ActiveRecord::Migration
  def change
    drop_table :actors
  end
end

# To change an existing table, create a new migration file

class AddDirectorNameToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :director_name, :string
  end
end

# To remove a column from a table, create a new migration file

class RemoveNameFromMoviesTable < ActiveRecord::Migration
  def change
    remove_column :movies, :name
  end
end

# To mess around with a column (keep but change)

class ChangeDirNameToTextType < ActiveRecord::Migration
  def change
    change_column :movies, :director_name, :text
  end
end

#:table, :what you're changing, :aspect of column you're changing

# Another example of fixing a table. Create migration file, add the below commands

class FixMoviesTable < ActiveRecord::Migration

  def change
    remove_column :movies, :director_name
    add_column :movies, :rating, :string
    add_column :movies, :name, :string
  end

end


# ASSOCIATIONS LETS TABLES TALK TO EACH OTHER

# create a column of studio Ids

class AddStudioIdToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :studio_id, :integer

  end
end

# studio_id is a NECESSARY NAME, can't be anything else. Singular_id

# Then you setup the relationship by editing the models as such:

class Movie < ActiveRecord::Base
  belongs_to :studio
end

class Studio < ActiveRecord::Base
  has_many :movies
end

# create a studio 

s1 = Studio.create(:name => "Universal", :budget => 3, :address => "Main St")

# but this doesn't work!

# Comment out THIS in config/application: config.active_record.whitelist_attributes = true

# NOW it works!

# see the studios in rails db

select * from studios

# Now you need to add studio IDs to movies

In rails c, you can do Studio.all and it's like select * from studios in rails db

Studio.first is the first active_record

Studio.last is the last record

Studio.count counts the number of studios

Studio.where(:name => "Universal") shows the studio where the name is Universal

Studio.where(:name => "Universal").first brings back only the first single object. the command above brings back an array where the statement is true

s1 = Studio.where(:name => "Universal").first #makes it a variable!

m1 = Movie.where(:name => "LOTR").first

because we did belongs_to and has_many, s1.movies exists as an empty array

m1.studio = s1

m1.save !!!

s1.reload # Need to do this!!

s1.movies


[23] pry(main)> m1.studio
=> #<Studio id: 1, name: "Universal", budget: #<BigDecimal:102de3f70,'0.3E1',9(18)>, address: "Main St", created_at: "2012-11-13 15:49:09", updated_at: "2012-11-13 15:49:09">

The above is a single, because the movie has only one studio

[24] pry(main)> s1.movies
=> [#<Movie id: 2, gross: #<BigDecimal:102f9e3b0,'0.5E4',9(18)>, created_at: "2012-11-13 15:55:34", updated_at: "2012-11-13 16:22:48", rating: "R", name: "LOTR", studio_id: 1>]

The above is an array because studio1 has many movies

Grab all the NC17 movies, assign them to Sony

sony = Studio.where(:name => "Sony").first
nc17 = Movie.where(:rating => "NC-17")
sony.movies = nc17

you can also seed like so:

IN SEEDS.RB

Movie.delete_all
Studio.delete_all

s1 = Studio.create(:name => "Universal", :budget => 3, :address => "hollywood")
s2 = Studio.create(:name => "Warner Bros", :budget => 5, :address => "hollywood")
s3 = Studio.create(:name => "Lionsgate", :budget => 7, :address => "hollywood")
s4 = Studio.create(:name => "Sony Pictures", :budget => 8, :address => "hollywood")
s5 = Studio.create(:name => "New Line", :budget => 11, :address => "hollywood")

m1 = Movie.create(:name => "Nemo", :gross => 9_0000, :rating => "G")
m2 = Movie.create(:name => "Titanic", :gross => 8_000, :rating => "PG")
m3 = Movie.create(:name => "LOTR", :gross => 7_000, :rating => "R")
m4 = Movie.create(:name => "Death", :gross => 6_000, :rating => "PG-13")
m5 = Movie.create(:name => "Apocalypse Now", :gross => 5_000, :rating => "NC-17")
m6 = Movie.create(:name => "The Shining", :gross => 4_000, :rating => "G")

s1.movies = [m1,m2]
s2.movies = [m3,m4,m5]
s3.movies << m6

# anytime you do an array assignment, automatically saves, don't need to do .save (you can, it won't break anything)
# when you delete all, it deletes all the data, but the IDs don't reset back to one

imdb2_development=# select * from movies;
 id |  gross  |         created_at         |         updated_at         | rating |      name      | studio_id 
----+---------+----------------------------+----------------------------+--------+----------------+-----------
  4 | 90000.0 | 2012-11-13 16:45:41.737822 | 2012-11-13 16:45:41.835493 | G      | Nemo           |         4
  5 |  8000.0 | 2012-11-13 16:45:41.74355  | 2012-11-13 16:45:41.838919 | PG     | Titanic        |         4
  6 |  7000.0 | 2012-11-13 16:45:41.747523 | 2012-11-13 16:45:41.844109 | R      | LOTR           |         5
  7 |  6000.0 | 2012-11-13 16:45:41.751178 | 2012-11-13 16:45:41.845945 | PG-13  | Death          |         5
  8 |  5000.0 | 2012-11-13 16:45:41.754671 | 2012-11-13 16:45:41.84768  | NC-17  | Apocalypse Now |         5
  9 |  4000.0 | 2012-11-13 16:45:41.758286 | 2012-11-13 16:45:41.851186 | G      | The Shining    |         6
(6 rows)

imdb2_development=# select * from studios;
 id |     name      | budget |  address  |         created_at         |         updated_at         
----+---------------+--------+-----------+----------------------------+----------------------------
  4 | Universal     |    3.0 | hollywood | 2012-11-13 16:45:41.661989 | 2012-11-13 16:45:41.661989
  5 | Warner Bros   |    5.0 | hollywood | 2012-11-13 16:45:41.701252 | 2012-11-13 16:45:41.701252
  6 | Lionsgate     |    7.0 | hollywood | 2012-11-13 16:45:41.70517  | 2012-11-13 16:45:41.70517
  7 | Sony Pictures |    8.0 | hollywood | 2012-11-13 16:45:41.708744 | 2012-11-13 16:45:41.708744
  8 | New Line      |   11.0 | hollywood | 2012-11-13 16:45:41.712348 | 2012-11-13 16:45:41.712348
(5 rows)

VALIDATING

[1] pry(main)> Person
=> Person(id: integer, name: string, age: integer, gender: string, email: string, address: text, city: string, state: string, zipcode: string, created_at: datetime, updated_at: datetime)
[2] pry(main)> p = Person.new
=> #<Person id: nil, name: nil, age: nil, gender: nil, email: nil, address: nil, city: nil, state: nil, zipcode: nil, created_at: nil, updated_at: nil>
[3] pry(main)> p.save
   (0.2ms)  BEGIN
   (0.3ms)  ROLLBACK
=> false
[4] pry(main)> p.errors
=> #<ActiveModel::Errors:0x000001016f3540
 @base=
  #<Person id: nil, name: nil, age: nil, gender: nil, email: nil, address: nil, city: nil, state: nil, zipcode: nil, created_at: nil, updated_at: nil>,
 @messages={:name=>["is too short (minimum is 3 characters)"]}>
[5] pry(main)> p.valid?
=> false
[6] pry(main)> 

ANOTHER EXAMPLE OF LENGTH VALIDATION

[1] pry(main)> p = Person.new
=> #<Person id: nil, name: nil, age: nil, gender: nil, email: nil, address: nil, city: nil, state: nil, zipcode: nil, created_at: nil, updated_at: nil>
[2] pry(main)> p.save
   (0.2ms)  BEGIN
   (0.3ms)  ROLLBACK
=> false
[3] pry(main)> p.errors
=> #<ActiveModel::Errors:0x00000102cb9d48
 @base=
  #<Person id: nil, name: nil, age: nil, gender: nil, email: nil, address: nil, city: nil, state: nil, zipcode: nil, created_at: nil, updated_at: nil>,
 @messages=
  {:name=>["is too short (minimum is 3 characters)"],
   :state=>["is the wrong length (should be 2 characters)"]}>
[4] pry(main)> p.name = "bobby"
=> "bobby"
[5] pry(main)> p.state = "NY"
=> "NY"
[6] pry(main)> p.save
   (0.2ms)  BEGIN
  SQL (9.9ms)  INSERT INTO "people" ("address", "age", "city", "created_at", "email", "gender", "name", "state", "updated_at", "zipcode") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"  [["address", nil], ["age", nil], ["city", nil], ["created_at", Tue, 13 Nov 2012 21:21:22 UTC +00:00], ["email", nil], ["gender", nil], ["name", "bobby"], ["state", "NY"], ["updated_at", Tue, 13 Nov 2012 21:21:22 UTC +00:00], ["zipcode", nil]]
   (0.9ms)  COMMIT
=> true
[7] pry(main)> 

ANOTHER EXAMPLE OF VALIDATION THIS TIME NUMERICALITY

[2] pry(main)> p = Person.new(:name => "Chris", :state =>"NY")
=> #<Person id: nil, name: "Chris", age: nil, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>
[3] pry(main)> p.save
   (0.2ms)  BEGIN
   (0.3ms)  ROLLBACK
=> false
[4] pry(main)> p.errors
=> #<ActiveModel::Errors:0x000001015f4e50
 @base=
  #<Person id: nil, name: "Chris", age: nil, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>,
 @messages={:age=>["is not a number"]}>
[5] pry(main)> p = Person.new(:name => "Chris", :state =>"NY", :age => 3)
=> #<Person id: nil, name: "Chris", age: 3, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>
[6] pry(main)> p.save
   (0.2ms)  BEGIN
   (0.2ms)  ROLLBACK
=> false
[7] pry(main)> p.errors
=> #<ActiveModel::Errors:0x00000102688af0
 @base=
  #<Person id: nil, name: "Chris", age: 3, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>,
 @messages={:age=>["must be greater than 17"]}>
[8] pry(main)> p = Person.new(:name => "Chris", :state =>"NY", :age => 18)
=> #<Person id: nil, name: "Chris", age: 18, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>
[9] pry(main)> p.save
   (0.2ms)  BEGIN
  SQL (10.0ms)  INSERT INTO "people" ("address", "age", "city", "created_at", "email", "gender", "name", "state", "updated_at", "zipcode") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"  [["address", nil], ["age", 18], ["city", nil], ["created_at", Tue, 13 Nov 2012 21:24:59 UTC +00:00], ["email", nil], ["gender", nil], ["name", "Chris"], ["state", "NY"], ["updated_at", Tue, 13 Nov 2012 21:24:59 UTC +00:00], ["zipcode", nil]]
   (0.8ms)  COMMIT
=> true

WAY MORE VALIDATION

class Person < ActiveRecord::Base
  validates :name, :length => { :minimum => 3 }
  validates :name, :uniqueness => true
  validates :state, :length => { :is => 2 }
  validates :age, :numericality => { :greater_than => 17}
  validates :gender, :presence => true
end

[1] pry(main)> p = Person.new(:name => "Chris", :state =>"NY", :age => 18)
=> #<Person id: nil, name: "Chris", age: 18, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>
[2] pry(main)> p.save
   (0.2ms)  BEGIN
  Person Exists (2.1ms)  SELECT 1 AS one FROM "people" WHERE "people"."name" = 'Chris' LIMIT 1
   (0.3ms)  ROLLBACK
=> false
[3] pry(main)> p.errors
=> #<ActiveModel::Errors:0x0000010145e7d0
 @base=
  #<Person id: nil, name: "Chris", age: 18, gender: nil, email: nil, address: nil, city: nil, state: "NY", zipcode: nil, created_at: nil, updated_at: nil>,
 @messages={:name=>["has already been taken"], :gender=>["can't be blank"]}>
[4] pry(main)> p.age = 19
=> 19
[5] pry(main)> p.gender = "male"
=> "male"
[6] pry(main)> p.name = "Joe"
=> "Joe"
[7] pry(main)> p.save
   (0.2ms)  BEGIN
  Person Exists (0.5ms)  SELECT 1 AS one FROM "people" WHERE "people"."name" = 'Joe' LIMIT 1
  SQL (3.4ms)  INSERT INTO "people" ("address", "age", "city", "created_at", "email", "gender", "name", "state", "updated_at", "zipcode") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"  [["address", nil], ["age", 19], ["city", nil], ["created_at", Tue, 13 Nov 2012 21:28:08 UTC +00:00], ["email", nil], ["gender", "male"], ["name", "Joe"], ["state", "NY"], ["updated_at", Tue, 13 Nov 2012 21:28:08 UTC +00:00], ["zipcode", nil]]
   (0.9ms)  COMMIT
=> true

CUSTOM VALIDATORS 1: EmailValidator

class Person < ActiveRecord::Base
  validates :name, :length => { :minimum => 3 }
  validates :name, :uniqueness => true
  validates :state, :length => { :is => 2 }
  validates :age, :numericality => { :greater_than => 17}
  validates :gender, :presence => true
  validates :email, :email => true
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.include?('@')
      record.errors[attribute] << "does not have an @ symbol"
    end
  end
end

CUSTOM VALIDATORS 2: CUSTOM VALIDATOR

class Person < ActiveRecord::Base
  validates_with PersonValidator
  validates :name, :length => { :minimum => 3 }
  validates :name, :uniqueness => true
  validates :state, :length => { :is => 2 }
  validates :age, :numericality => { :greater_than => 17}
  validates :gender, :presence => true
  validates :email, :email => true
end

class PersonValidator < ActiveModel::Validator
  def validate(record)
    if (record.state != "NY") && (record.age < 18)
      record.errors[:base] << "must be from NY and be 18"
    end
  end
end

LAB

http://www.omdbapi.com/?t=titanic

That's how queries work

[2] pry(main)> response = HTTParty.get('http://omdbapi.com/?t=True+Grit')
=> "{\"Title\":\"True Grit\",\"Year\":\"2010\",\"Rated\":\"PG-13\",\"Released\":\"22 Dec 2010\",\"Runtime\":\"1 h 50 min\",\"Genre\":\"Adventure, Drama, Western\",\"Director\":\"Ethan Coen, Joel Coen\",\"Writer\":\"Joel Coen, Ethan Coen\",\"Actors\":\"Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin\",\"Plot\":\"A tough U.S. Marshal helps a stubborn young woman track down her father's murderer.\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjIxNjAzODQ0N15BMl5BanBnXkFtZTcwODY2MjMyNA@@._V1_SX300.jpg\",\"imdbRating\":\"7.8\",\"imdbVotes\":\"137,904\",\"imdbID\":\"tt1403865\",\"Response\":\"True\"}"
[3] pry(main)> json = JSON(response)
=> {"Title"=>"True Grit",
 "Year"=>"2010",
 "Rated"=>"PG-13",
 "Released"=>"22 Dec 2010",
 "Runtime"=>"1 h 50 min",
 "Genre"=>"Adventure, Drama, Western",
 "Director"=>"Ethan Coen, Joel Coen",
 "Writer"=>"Joel Coen, Ethan Coen",
 "Actors"=>"Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin",
 "Plot"=>
  "A tough U.S. Marshal helps a stubborn young woman track down her father's murderer.",
 "Poster"=>
  "http://ia.media-imdb.com/images/M/MV5BMjIxNjAzODQ0N15BMl5BanBnXkFtZTcwODY2MjMyNA@@._V1_SX300.jpg",
 "imdbRating"=>"7.8",
 "imdbVotes"=>"137,904",
 "imdbID"=>"tt1403865",
 "Response"=>"True"}
[4] pry(main)> json.class
=> Hash
[5] pry(main)> json.keys
=> ["Title",
 "Year",
 "Rated",
 "Released",
 "Runtime",
 "Genre",
 "Director",
 "Writer",
 "Actors",
 "Plot",
 "Poster",
 "imdbRating",
 "imdbVotes",
 "imdbID",
 "Response"]
[6] pry(main)> json["Actors"]
=> "Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin"
[7] pry(main)> json["Genre"]
=> "Adventure, Drama, Western"

Movie or quit? Get the movie, return JSON.

Insert movie into database

Pull directors out, insert them into tables

split the director names 
split the genres
save them in the database, attach them to that specific movie 

validate if genre exists

Genre.where(:name => "drama")

find it and attach to movie if it exists
see if data exists in database
pull it out using the where, then attach it

JSON is a rails function that parses a string, turns it into JSON

[2] pry(main)> response = HTTParty.get('http://omdbapi.com/?t=True+Grit')
=> "{\"Title\":\"True Grit\",\"Year\":\"2010\",\"Rated\":\"PG-13\",\"Released\":\"22 Dec 2010\",\"Runtime\":\"1 h 50 min\",\"Genre\":\"Adventure, Drama, Western\",\"Director\":\"Ethan Coen, Joel Coen\",\"Writer\":\"Joel Coen, Ethan Coen\",\"Actors\":\"Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin\",\"Plot\":\"A tough U.S. Marshal helps a stubborn young woman track down her father's murderer.\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjIxNjAzODQ0N15BMl5BanBnXkFtZTcwODY2MjMyNA@@._V1_SX300.jpg\",\"imdbRating\":\"7.8\",\"imdbVotes\":\"137,904\",\"imdbID\":\"tt1403865\",\"Response\":\"True\"}"
[3] pry(main)> json = JSON(response)
=> {"Title"=>"True Grit",
 "Year"=>"2010",
 "Rated"=>"PG-13",
 "Released"=>"22 Dec 2010",
 "Runtime"=>"1 h 50 min",
 "Genre"=>"Adventure, Drama, Western",
 "Director"=>"Ethan Coen, Joel Coen",
 "Writer"=>"Joel Coen, Ethan Coen",
 "Actors"=>"Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin",
 "Plot"=>
  "A tough U.S. Marshal helps a stubborn young woman track down her father's murderer.",
 "Poster"=>
  "http://ia.media-imdb.com/images/M/MV5BMjIxNjAzODQ0N15BMl5BanBnXkFtZTcwODY2MjMyNA@@._V1_SX300.jpg",
 "imdbRating"=>"7.8",
 "imdbVotes"=>"137,904",
 "imdbID"=>"tt1403865",
 "Response"=>"True"}
[4] pry(main)> json.class
=> Hash
[5] pry(main)> json.keys
=> ["Title",
 "Year",
 "Rated",
 "Released",
 "Runtime",
 "Genre",
 "Director",
 "Writer",
 "Actors",
 "Plot",
 "Poster",
 "imdbRating",
 "imdbVotes",
 "imdbID",
 "Response"]
[6] pry(main)> json["Actors"]
=> "Jeff Bridges, Matt Damon, Hailee Steinfeld, Josh Brolin"
[7] pry(main)> json["Genre"]
=> "Adventure, Drama, Western"
