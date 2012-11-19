PORTS

2^16 ports originally on the computer
0 - 65535 this many ports

port 21 FTP
port 80 is HTTP, the web
ports for email, POP3 SMTP etc.

numbers between 0-1024 (2^10) are reserved by your system
but 1024 - 65535 are available to you

when rails server starts it's listening on 3000 because that's a free port

you can do rails s -p 5000 for 5000

you can have 5 rails sites running on different ports at the same time: 3000,3001, etc.

UI

Starts with URL + VERB

GET => show me the thing (server sending info to you)
POST => new thing (you're messing with the database) if there's a form displayed, and you want to create something new
PUT => update thing (you're messing with the database)
DELETE => delete thing (you're messing with the database)

These four verbs are central to rails

URL + VERB specified in ROUTES.RB in CONFIG
ROUTING always takes you to CONTROLLER

match '/hello' => 'hello#world', :via => :get
  # url + verb (get) takes you to controller 'hello', action 'world'

create hello_controller.rb needs to have this syntax

inside:

class HelloController < ApplicationController
  def world
    render :text => "hello world!!!"
  end
end

# method world is the action in the controller

http://localhost:3000/hello then does this!!


erb = embedded ruby file = html and ruby together

THIS IS THE FLOW FOR TIME WARP

in ROUTES

match '/time' => 'time#warp', :via => :get

in controllers, time_controller

class TimeController < ApplicationController
  def warp
    
  end
end

because nothing defined in there, sends to 

app/views/time/warp.html.erb

that is sent to the PC

in that file, we can put:

<h1>
  the current time is <%= Time.current %>
</h1>

Between the <% %> that's the ruby code the server processes the ruby and sends it to the browser

If you have an = sign, <%= the code in there gets printed out

If you don't have an = sign, then the code just gets executed, but not printed out

<% a = 'awesome' %>

<h1>
  the <%= a %> time is <%= Time.current %>
</h1>

actually the app renders views/layouts/application.html.erb

and the warp.html.erb gets INSERTED into <%= yield %> in that application.html.erb

CSS 

You can go alter styles in app/assets/stylesheets/application.css

MOVIEZ

match '/' => 'home#index' 

GET is default. Don't need to specify in routes if you don't want

RAKE ROUTES

~/Dropbox/wdi/rails/labs/moviez ✗ master > rake routes
       /                home#index
about  /about(.:format) home#about
  faq  /faq(.:format)   home#faq

2nd column is url
1st column is what you use in link_to

about_path creates /about #relative url - most of the time use this
about_url creates http://localhost:3000/about #absolute url

here's the nav in the application template:

<nav> 
  <%= link_to "Home", "/"%>
  <%= link_to "About", about_path %>
  <%= link_to "FAQ", faq_path %>
</nav>

/movies => MoviesController

call method index

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end


<% @movies.each do |movie| %>
  <ul>
    <li><%= movie.name %></li>
    <li><%= movie.gross %></li>
    <li><%= movie.actors %></li>
    <li><%= movie.poster %></li>
  </ul>
<% end %>

params is a hash of submitted info

user raise params.inspect to see what the data coming in looks like

get to name submitted

params["name"] = "Jaws"

def create
  movie_name = params[:name]
  Movie.create(:name => movie_name)
end


<% @movies.each do |movie| %>
  <%= image_tag movie.poster %>
  <ul>
    <li><%= movie.name %></li>
    <li><%= movie.gross %></li>
    <li><%= movie.actors %></li>
    <li><%= link_to "Delete movie", delete_movie_path(movie), :method => :delete %></li>
  </ul>
<% end %>

Movie.find(9) => How you find a specific movie using the ID method

HOW TO INSPECT AN ITEM!!!!
raise @stocks_split.inspect