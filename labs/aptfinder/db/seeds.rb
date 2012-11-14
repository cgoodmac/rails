# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Apartment.delete_all
Tenant.delete_all
Pet.delete_all

a1 = Apartment.create(:name => "A1", :rooms => 3, :rent => 1500)
a2 = Apartment.create(:name => "A2", :rooms => 2, :rent => 1000)
a3 = Apartment.create(:name => "A3", :rooms => 1, :rent => 1000)

t1 = Tenant.create(:name => "Chris", :age => 30, :gender => "male")
t2 = Tenant.create(:name => "Sally", :age => 20, :gender => "female")
t3 = Tenant.create(:name => "Joe", :age => 40, :gender => "male")
t4 = Tenant.create(:name => "Jenny", :age => 50, :gender => "female")
t5 = Tenant.create(:name => "Steve", :age => 25, :gender => "male")
t6 = Tenant.create(:name => "Sue", :age => 35, :gender => "female")

p1 = Pet.create(:name => "Pug", :age =>5, :species => "dog")
p2 = Pet.create(:name => "Wolf", :age =>2, :species => "dog")
p3 = Pet.create(:name => "Garfield", :age => 10, :species => "cat")
p4 = Pet.create(:name => "Polly", :age =>6, :species => "parrot")
p5 = Pet.create(:name => "Donatello", :age => 7, :species => "turtle")
p6 = Pet.create(:name => "Nemo", :age =>10, :species => "fish")
p7 = Pet.create(:name => "Larry", :age =>2, :species => "monkey")
p8 = Pet.create(:name => "George", :age =>15, :species => "monkey")

a1.tenants = [t1, t2, t3]
a2.tenants = [t4, t5]
a3.tenants = [t6]

t1.pets = [p1, p2, p3]
t2.pets = [p4, p5]
t3.pets << p6
t4.pets = [p7, p8]


