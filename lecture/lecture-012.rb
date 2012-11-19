DEBUGGING

Three techniques

1. you can put 'binding.pry' anywhere
look in the server console, and you can use it just like pry

you can do it in the view too:
  <% binding.pry %>

2. On html pages, you can do this too:
  <%= debug @movies %>

3. Rails footnotes:
Add this: gem 'rails-footnotes' to gem file

Run this in the prompt in the folder: rails g rails_footnotes:install

Then you'll see footnotes in output

To turn off, comment out the line Footnotes.run! in rails_footnotes.rb in config/initializers

Then, stop and restart the server

PARTIALS

Lets you duplicate code in multiple places

_form.html.erb

<%= render 'form' %>

resources :animals

does: 


  match '/animals' => 'animals#index', :via => :get
  match '/animals' => 'animals#create', :via => :post
  match '/animals/new' => 'animals#new', :via => :get
  match '/animals/:id' => 'animals#show', :via => :get, :as => 'animal' #defines route so you can link to each animal automatically
  match '/animals/:id/edit' => 'animals#edit', :via => :get, :as => 'edit_animal'
  match '/animals/:id' => 'animals#update', :via => :put
  match '/animals/:id' => 'animals#destroy', :via => :delete, :as => 'delete_animal'