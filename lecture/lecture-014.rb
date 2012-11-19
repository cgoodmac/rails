rails g scaffold person name:string photo:string

rails g uploader ProfilePic

class Person < ActiveRecord::Base
  mount_uploader :photo, ProfilePicUploader
end

Add this to forms:

:html => {:multipart => true} 

So forms look like:

<%= form_for(@person, :html => {:multipart => true}) do |f| %>
  <% if @person.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@person.errors.count, "error") %> prohibited this person from being saved:</h2>

      <ul>
      <% @person.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :photo %><br />
    <%= f.file_field :photo %>
    <%= f.hidden_field :photo_cache %>
    <%= f.text_field :remote_photo_url %>
    <%= image_tag( @person.photo_url) if  @person.photo? %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

AMAZON S3

Buckets are like harddrives

RECRUITER QUESTION

What gems do you know?

pry-rails
yahoofinance
carrierwave
fog => amazon integration 
annotate
rails footnotes
don't say scafford

CONFIG/INITIALIZERS

files that start when rails initializes

Paste in new file: carrierwave_init.rb 

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWSKEY'],       # required
    :aws_secret_access_key  => ENV['AWSSEC'],       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'chris-slideshow'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.asset_host     = 'https://assets.example.com'            # optional, defaults to nil
end

IN CONSOLE:

export AWSKEY=AKIAICADQLQOILTVXRDQ
export AWSSEC=lr9iYsxR+4rrTZ6HYrojTgTJgTlSnZ2MzjTyflej

you can put the export command in the .bash_profile so it loads every time

in uploaders/profile_pic_uploader.rb, comment out storage :file
uncomment storage :fog

SONGZ

create, edit, delete or show a song, album, artist
each one of these above will have a name and a photo associated with it

you should be able to list all songs, all albums all artists

if you click on a song -> it should show all the artists and albums that song is on
if you click on an artist -> it should show all the albums that artist made
if you click on an album -> it should show all the songs on that album

you should have a home page

use reset.css

have a navigation system

style the app

deploy to heroku

PM will 
1. create a repo on github
2. go into group folder, do rails new songz 
3. git init
4. paste in line git remote add origin (web address)
5. edit .gitignore , add this: /config/database.yml
6. git add .
7. git commit -m 
8. git push
9. go into admin section, add contributors

Other people
cd wdi/group/
git clone (web address)



