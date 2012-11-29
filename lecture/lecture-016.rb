To nuke your heroku database

heroku pg:reset 

TO DO LOGINS

PC goes to GET /photos from Rails

Rails creates a session with an ID

Rails sends you a cookie with the number X

Everytime you go back to website, sends back the cookie with X in it

the cookie ID is a 16^123 number, which is large enough 

Session is a hash with stuff like 'name' => 'Chris'

session[:name] = 'Chris'

need to add a column to object table for passwords

class AddPasswordDigestToNinjasTable < ActiveRecord::Migration
  def change
  		add_column :ninjas, :password_digest, :string
  end
end

need to alter object model

class Ninja < ActiveRecord::Base
	has_secure_password
end

add 'bcrypt-ruby' gem

need to restart server too

add password field, confirmation

  <div class="field">
    <%= f.label :password %><br />
    <%= f.password_field :password %>
  </div>  

  <div class="field">
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation %>
  </div>  

Rails will check two same

Takes the password, encrypts it, gets saved as password_digest

You can see the encrypted password in Rails console here:

Ninja.last.password_digest

CREATING A LOGIN

/login -> session#new -> name/password form -> posts to /login session#create

GOOD, then go to ninja index page

BAD, then back to login page


Create routes
match '/login' => 'session#new', :via => :get
match '/login' => 'session#create', :via => :post
match '/logout' => 'session#destroy', :via => :get

Create session controller
class SessionController < ApplicationController
	def new
	end
	def create
		ninja = Ninja.find_by_name(params[:name])
		if ninja && ninja.authenticate(params[:password])
			session[:user_id] = ninja.id
			redirect_to ninjas_path
		else 
			render :new
		end
	end
	def destroy
	end
end




ADD TO APPLICATION CONTROLLER THIS SO THIS IS THE FIRST THING THAT RUNS:

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user
  private 

  def authenticate_user
  	if session[:user_id]
  		@authenticated_user = Ninja.find(session[:user_id])
  	else
  		@authenticated_user = nil
  	end
  end
  
end

COMPLEX MODELS THAT INVOLVE VIEWS PUT IN HELPERS

Use application_helper functions for views switching

DATING SITE

1. make logo

2. register

username
password
password confirm

3. login (require them to login, redirect there if fail)

4. fill out profile

tagline
photos [p1,p2,p3]
mark one as main photo
age 
gender
city, state
ethnicity
description => they describe themselves

5. create questions and answers

q1, q2, q3, q4
a1
a2
a3
a4 

6. search for people, find someone, have to answer their question to msg them

based on various criteria

then results pop up

try to contact

question pops up

if you answer correctly, you can message someone

private messaging system


class UsersController < ApplicationController
  before_filter :ensure_logged_in
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def ensure_logged_in
    redirect_to root_path if @auth.nil?
  end
end


Form tag for photo, with radiobuttons, main image, Is_default, boolean

In upload checkbox (is_default) true







  

