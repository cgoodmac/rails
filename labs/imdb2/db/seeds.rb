# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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