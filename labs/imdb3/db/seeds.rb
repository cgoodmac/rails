# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.delete_all
Studio.delete_all
Actor.delete_all
Director.delete_all

s1 = Studio.create(:name => "Universal")
s2 = Studio.create(:name => "Lucasfilm")

m1 = Movie.create(:name => "Jurassic Park")
m2 = Movie.create(:name => "Star Wars")

a1 = Actor.create(:name => "Laura Dern")
a2 = Actor.create(:name => "Harrison Ford")

d1 = Director.create(:name => "Steven Spielberg")
d2 = Director.create(:name => "George Lucas")

s1.movies = [m1]

a2.movies = [m2]

d1.movies = [m1]
d2.movies = [m2]

m1.actors = [a1]