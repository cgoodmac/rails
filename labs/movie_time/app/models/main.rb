class Main

  def self.run

    puts "Get (m)ovies or (q)uit?"
    response = gets.chomp

    while response != 'q'

      puts "What movie?"
      movie = gets.chomp

      movie_search = movie.gsub(" ","+")

      query = HTTParty.get('http://omdbapi.com/?t='+ movie_search)

      json = JSON(query)

      genre_split = json["Genre"].split(', ')

      actors_split = json["Actors"].split(', ')

      year = json["Year"]
      rated = json["Rated"]
      runtime = json["Runtime"]

      m1 = Movie.create(:name => movie, :year => year, :rated => rated, :runtime => runtime)

      genre_split.each do |i|
        if Genre.where(:name => i)
          g1 = Genre.where(:name => i)
          g1.movies << m1
        else
          g1 = Genre.create(:name => i)
          m1.genres << g1
        end 
      end  

      actors_split.each do |i|
        if Actor.where(:name => i)
          a1 = Actor.where(:name => i)
          a1.movies << m1
        else 
          a1 = Actor.create(:name => i)
          m1.actors << a1
        end  
      end 

      puts "Get (m)ovies or (q)uit?"
      response = gets.chomp

    end
  end
end