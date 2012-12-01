class God < ActiveRecord::Base
  attr_accessible :description, :name

  def self.text_search(query)
      self.where("name @@ :q or description @@ :q", :q => query)
  end
end

# @@ means INSIDE. :q is the QUERY.
# if the query = apollo, then it means
# "name INSIDE apollo or description INSIDE apollo"
# search here is advanced, it knows plurals, not case-sensitive, sounds like