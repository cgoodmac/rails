class Movie < ActiveRecord::Base
  attr_accessible :description, :gross, :name, :rating, :release_date, :tickets_sold
end
