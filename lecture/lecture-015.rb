Add production login credentials to database.yml

rake -T shows all rake commands

Package assets:

rake assets:clean

rake assets:precompile

compresses and uglifies js, css, images, etc

then just git add and commit

heroku create

git remote -v to see paths

git push heroku master

now you have to create the db on heroku. creates the production database

heroku run rake db:create

heroku run rake db:migrate

heroku can't do seed because it doesnt have our amazon 

heroku config:add AWSKEY=xxx AWSSEC=yyy

SONGZ REVIEW

all relationships between songs/artists/albums are many to many

if it could be the case, then you have to code for all potential cases

Join tables between artists and songs and songs and albums

Artists<->Songs<->Albums

<% render :partial => 'shared/song', :collection => @songs, :as => :song %>

above is the same as 

@songs.each do |song|
  render :partial=>'shared/song'
end

GIT BRANCH REVIEW

git commit -m "making sure committed before branch"
git branch cgoodmac
git checkout cgoodmac

gem 'rmagick'

in PhotoUploader:

  include CarrierWave::RMagick

  version :thumb do
    process :resize_to_fill => [150, 150]
  end

song.photo_url goes to original
song.photo.thumb_url goes to thumb

DELETE BRANCH
git branch -D cgoodmac
git push origin --delete cgoodmac

MUSIC DOGZ

~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > rails g scaffold dog name:string song:string youtube:string
      invoke  active_record
      create    db/migrate/20121119182645_create_dogs.rb
      create    app/models/dog.rb
      invoke    test_unit
      create      test/unit/dog_test.rb
      create      test/fixtures/dogs.yml
      invoke  resource_route
       route    resources :dogs
      invoke  scaffold_controller
      create    app/controllers/dogs_controller.rb
      invoke    erb
      create      app/views/dogs
      create      app/views/dogs/index.html.erb
      create      app/views/dogs/edit.html.erb
      create      app/views/dogs/show.html.erb
      create      app/views/dogs/new.html.erb
      create      app/views/dogs/_form.html.erb
      invoke    test_unit
      create      test/functional/dogs_controller_test.rb
      invoke    helper
      create      app/helpers/dogs_helper.rb
      invoke      test_unit
      create        test/unit/helpers/dogs_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/dogs.js.coffee
      invoke    scss
      create      app/assets/stylesheets/dogs.css.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.css.scss
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git commit -m "dog music for some reason"
[master 8b3ddbe] dog music for some reason
 53 files changed, 1540 insertions(+), 0 deletions(-)
 create mode 100644 labs/muzikdemo/.gitignore
 create mode 100644 labs/muzikdemo/Gemfile
 create mode 100644 labs/muzikdemo/Gemfile.lock
 create mode 100644 labs/muzikdemo/README.rdoc
 create mode 100644 labs/muzikdemo/Rakefile
 create mode 100644 labs/muzikdemo/app/assets/images/rails.png
 create mode 100644 labs/muzikdemo/app/assets/javascripts/application.js
 create mode 100644 labs/muzikdemo/app/assets/javascripts/dogs.js.coffee
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/application.css
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/dogs.css.scss
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/scaffolds.css.scss
 create mode 100644 labs/muzikdemo/app/controllers/application_controller.rb
 create mode 100644 labs/muzikdemo/app/controllers/dogs_controller.rb
 create mode 100644 labs/muzikdemo/app/helpers/application_helper.rb
 create mode 100644 labs/muzikdemo/app/helpers/dogs_helper.rb
 create mode 100644 labs/muzikdemo/app/mailers/.gitkeep
 create mode 100644 labs/muzikdemo/app/models/.gitkeep
 create mode 100644 labs/muzikdemo/app/models/dog.rb
 create mode 100644 labs/muzikdemo/app/views/dogs/_form.html.erb
 create mode 100644 labs/muzikdemo/app/views/dogs/edit.html.erb
 create mode 100644 labs/muzikdemo/app/views/dogs/index.html.erb
 create mode 100644 labs/muzikdemo/app/views/dogs/new.html.erb
 create mode 100644 labs/muzikdemo/app/views/dogs/show.html.erb
 create mode 100644 labs/muzikdemo/app/views/layouts/application.html.erb
 create mode 100644 labs/muzikdemo/config.ru
 create mode 100644 labs/muzikdemo/config/application.rb
 create mode 100644 labs/muzikdemo/config/boot.rb
 create mode 100644 labs/muzikdemo/config/database.yml
 create mode 100644 labs/muzikdemo/config/environment.rb
 create mode 100644 labs/muzikdemo/config/environments/development.rb
 create mode 100644 labs/muzikdemo/config/environments/production.rb
 create mode 100644 labs/muzikdemo/config/environments/test.rb
 create mode 100644 labs/muzikdemo/config/initializers/backtrace_silencers.rb
 create mode 100644 labs/muzikdemo/config/initializers/inflections.rb
 create mode 100644 labs/muzikdemo/config/initializers/mime_types.rb
 create mode 100644 labs/muzikdemo/config/initializers/secret_token.rb
 create mode 100644 labs/muzikdemo/config/initializers/session_store.rb
 create mode 100644 labs/muzikdemo/config/initializers/wrap_parameters.rb
 create mode 100644 labs/muzikdemo/config/locales/en.yml
 create mode 100644 labs/muzikdemo/config/routes.rb
 create mode 100644 labs/muzikdemo/db/migrate/20121119182645_create_dogs.rb
 create mode 100644 labs/muzikdemo/db/seeds.rb
 create mode 100644 labs/muzikdemo/doc/README_FOR_APP
 create mode 100644 labs/muzikdemo/lib/assets/.gitkeep
 create mode 100644 labs/muzikdemo/lib/tasks/.gitkeep
 create mode 100644 labs/muzikdemo/log/.gitkeep
 create mode 100644 labs/muzikdemo/public/404.html
 create mode 100644 labs/muzikdemo/public/422.html
 create mode 100644 labs/muzikdemo/public/500.html
 create mode 100644 labs/muzikdemo/public/favicon.ico
 create mode 100644 labs/muzikdemo/public/index.html
 create mode 100644 labs/muzikdemo/public/robots.txt
 create mode 100755 labs/muzikdemo/script/rails
 create mode 100644 labs/muzikdemo/test/fixtures/.gitkeep
 create mode 100644 labs/muzikdemo/test/fixtures/dogs.yml
 create mode 100644 labs/muzikdemo/test/functional/.gitkeep
 create mode 100644 labs/muzikdemo/test/functional/dogs_controller_test.rb
 create mode 100644 labs/muzikdemo/test/integration/.gitkeep
 create mode 100644 labs/muzikdemo/test/performance/browsing_test.rb
 create mode 100644 labs/muzikdemo/test/test_helper.rb
 create mode 100644 labs/muzikdemo/test/unit/.gitkeep
 create mode 100644 labs/muzikdemo/test/unit/dog_test.rb
 create mode 100644 labs/muzikdemo/test/unit/helpers/dogs_helper_test.rb
 create mode 100644 labs/muzikdemo/vendor/assets/javascripts/.gitkeep
 create mode 100644 labs/muzikdemo/vendor/assets/stylesheets/.gitkeep
 create mode 100644 labs/muzikdemo/vendor/plugins/.gitkeep
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git branch cats
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git checkout cats
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'cats'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > rails g scaffold cat name:string song:string youtube:string
      invoke  active_record
      create    db/migrate/20121119183025_create_cats.rb
      create    app/models/cat.rb
      invoke    test_unit
      create      test/unit/cat_test.rb
      create      test/fixtures/cats.yml
      invoke  resource_route
       route    resources :cats
      invoke  scaffold_controller
      create    app/controllers/cats_controller.rb
      invoke    erb
      create      app/views/cats
      create      app/views/cats/index.html.erb
      create      app/views/cats/edit.html.erb
      create      app/views/cats/show.html.erb
      create      app/views/cats/new.html.erb
      create      app/views/cats/_form.html.erb
      invoke    test_unit
      create      test/functional/cats_controller_test.rb
      invoke    helper
      create      app/helpers/cats_helper.rb
      invoke      test_unit
      create        test/unit/helpers/cats_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/cats.js.coffee
      invoke    scss
      create      app/assets/stylesheets/cats.css.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.css.scss
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch
* cats
  master
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "cats"
[cats 3a4537f] cats
 16 files changed, 266 insertions(+), 0 deletions(-)
 create mode 100644 labs/muzikdemo/app/assets/javascripts/cats.js.coffee
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/cats.css.scss
 create mode 100644 labs/muzikdemo/app/controllers/cats_controller.rb
 create mode 100644 labs/muzikdemo/app/helpers/cats_helper.rb
 create mode 100644 labs/muzikdemo/app/models/cat.rb
 create mode 100644 labs/muzikdemo/app/views/cats/_form.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/edit.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/index.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/new.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/show.html.erb
 create mode 100644 labs/muzikdemo/db/migrate/20121119183025_create_cats.rb
 create mode 100644 labs/muzikdemo/test/fixtures/cats.yml
 create mode 100644 labs/muzikdemo/test/functional/cats_controller_test.rb
 create mode 100644 labs/muzikdemo/test/unit/cat_test.rb
 create mode 100644 labs/muzikdemo/test/unit/helpers/cats_helper_test.rb
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch
* cats
  master
  mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git checkout mp3
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'mp3'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git checkout cats
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'cats'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "mp3"
# On branch cats
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch mp3
fatal: A branch named 'mp3' already exists.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > branch
 ✗ cats
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > branch
 ✗ cats
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "sup"
# On branch cats
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git checkout master
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'master'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git branch
  cats
* master
  mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git checkout mp3
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'mp3'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rake db:create
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rake db:migrate
==  CreateDogs: migrating =====================================================
-- create_table(:dogs)
   -> 0.0029s
==  CreateDogs: migrated (0.0036s) ============================================

==  CreateCats: migrating =====================================================
-- create_table(:cats)
   -> 0.0027s
==  CreateCats: migrated (0.0046s) ============================================

~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rails g uploader Music
Could not find generator uploader.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > bundle
Using rake (10.0.2) 
Using i18n (0.6.1) 
Using multi_json (1.3.7) 
Using activesupport (3.2.9) 
Using builder (3.0.4) 
Using activemodel (3.2.9) 
Using erubis (2.7.0) 
Using journey (1.0.4) 
Using rack (1.4.1) 
Using rack-cache (1.2) 
Using rack-test (0.6.2) 
Using hike (1.2.1) 
Using tilt (1.3.3) 
Using sprockets (2.2.1) 
Using actionpack (3.2.9) 
Using mime-types (1.19) 
Using polyglot (0.3.3) 
Using treetop (1.4.12) 
Using mail (2.4.4) 
Using actionmailer (3.2.9) 
Using arel (3.0.2) 
Using tzinfo (0.3.35) 
Using activerecord (3.2.9) 
Using activeresource (3.2.9) 
Using bundler (1.2.1) 
Using carrierwave (0.7.1) 
Using coffee-script-source (1.4.0) 
Using execjs (1.4.0) 
Using coffee-script (2.2.0) 
Using rack-ssl (1.3.2) 
Using json (1.7.5) 
Using rdoc (3.12) 
Using thor (0.16.0) 
Using railties (3.2.9) 
Using coffee-rails (3.2.2) 
Using jquery-rails (2.1.3) 
Using rails (3.2.9) 
Using sass (3.2.3) 
Using sass-rails (3.2.5) 
Using sqlite3 (1.3.6) 
Using uglifier (1.3.0) 
Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rails g uploader Music
      create  app/uploaders/music_uploader.rb
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > 

<%= form_for(@dog, :html => {:multipart => true}) do |f| %>
  <% if @dog.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@dog.errors.count, "error") %> prohibited this dog from being saved:</h2>

      <ul>
      <% @dog.errors.full_messages.each do |msg| %>
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
    <%= f.label :song %><br />
    <%= f.file_field :song %>
  </div>
  <div class="field">
    <%= f.label :youtube %><br />
    <%= f.text_field :youtube %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

ADD HTML multipart
TURN TEXT_FIELD TO FILE_FIELD

AUDIO SHOW:

<%= audio_tag @dog.song, :controls => true %>

AUDIO FORM:

<%= form_for(@dog, :html => {:multipart => true}) do |f| %>
  <% if @dog.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@dog.errors.count, "error") %> prohibited this dog from being saved:</h2>

      <ul>
      <% @dog.errors.full_messages.each do |msg| %>
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
    <%= f.label :song %><br />
    <%= f.file_field :song %>
  </div>
  <div class="field">
    <%= f.label :youtube %><br />
    <%= f.text_field :youtube %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch
* cats
  master
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "cats"
[cats 3a4537f] cats
 16 files changed, 266 insertions(+), 0 deletions(-)
 create mode 100644 labs/muzikdemo/app/assets/javascripts/cats.js.coffee
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/cats.css.scss
 create mode 100644 labs/muzikdemo/app/controllers/cats_controller.rb
 create mode 100644 labs/muzikdemo/app/helpers/cats_helper.rb
 create mode 100644 labs/muzikdemo/app/models/cat.rb
 create mode 100644 labs/muzikdemo/app/views/cats/_form.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/edit.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/index.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/new.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/show.html.erb
 create mode 100644 labs/muzikdemo/db/migrate/20121119183025_create_cats.rb
 create mode 100644 labs/muzikdemo/test/fixtures/cats.yml
 create mode 100644 labs/muzikdemo/test/functional/cats_controller_test.rb
 create mode 100644 labs/muzikdemo/test/unit/cat_test.rb
 create mode 100644 labs/muzikdemo/test/unit/helpers/cats_helper_test.rb
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch
* cats
  master
  mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git checkout mp3
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'mp3'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git checkout cats
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'cats'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "mp3"
# On branch cats
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch mp3
fatal: A branch named 'mp3' already exists.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > branch
 ✗ cats
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > branch
 ✗ cats
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git commit -m "sup"
# On branch cats
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git checkout master
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'master'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git branch
  cats
* master
  mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git checkout mp3
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'mp3'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rake db:create
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rake db:migrate
==  CreateDogs: migrating =====================================================
-- create_table(:dogs)
   -> 0.0029s
==  CreateDogs: migrated (0.0036s) ============================================

==  CreateCats: migrating =====================================================
-- create_table(:cats)
   -> 0.0027s
==  CreateCats: migrated (0.0046s) ============================================

~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rails g uploader Music
Could not find generator uploader.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > bundle
Using rake (10.0.2) 
Using i18n (0.6.1) 
Using multi_json (1.3.7) 
Using activesupport (3.2.9) 
Using builder (3.0.4) 
Using activemodel (3.2.9) 
Using erubis (2.7.0) 
Using journey (1.0.4) 
Using rack (1.4.1) 
Using rack-cache (1.2) 
Using rack-test (0.6.2) 
Using hike (1.2.1) 
Using tilt (1.3.3) 
Using sprockets (2.2.1) 
Using actionpack (3.2.9) 
Using mime-types (1.19) 
Using polyglot (0.3.3) 
Using treetop (1.4.12) 
Using mail (2.4.4) 
Using actionmailer (3.2.9) 
Using arel (3.0.2) 
Using tzinfo (0.3.35) 
Using activerecord (3.2.9) 
Using activeresource (3.2.9) 
Using bundler (1.2.1) 
Using carrierwave (0.7.1) 
Using coffee-script-source (1.4.0) 
Using execjs (1.4.0) 
Using coffee-script (2.2.0) 
Using rack-ssl (1.3.2) 
Using json (1.7.5) 
Using rdoc (3.12) 
Using thor (0.16.0) 
Using railties (3.2.9) 
Using coffee-rails (3.2.2) 
Using jquery-rails (2.1.3) 
Using rails (3.2.9) 
Using sass (3.2.3) 
Using sass-rails (3.2.5) 
Using sqlite3 (1.3.6) 
Using uglifier (1.3.0) 
Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > rails g uploader Music
      create  app/uploaders/music_uploader.rb
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git add .
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git commit -m "mp3 and youtube"
[mp3 60c340f] mp3 and youtube
 10 files changed, 99 insertions(+), 7 deletions(-)
 create mode 100644 labs/muzikdemo/app/uploaders/music_uploader.rb
 create mode 100644 labs/muzikdemo/app/views/shared/_youtube.html.erb
 create mode 100644 labs/muzikdemo/db/schema.rb
 create mode 100644 labs/muzikdemo/public/uploads/dog/song/1/01_Fuckin_Problem__prod._40___feat._2Chainz__Drake__Kendrick_Lamar_.mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git status
# On branch mp3
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# modified:   ../exercise_04/app/controllers/home_controller.rb
# modified:   ../exercise_04/app/views/home/getstocks.html.erb
# modified:   ../exercise_04/config/routes.rb
# modified:   ../exercise_05/Gemfile
# modified:   ../exercise_05/Gemfile.lock
# modified:   ../exercise_05/app/controllers/home_controller.rb
# modified:   ../exercise_05/app/views/home/index.html.erb
# modified:   ../moviez/config/routes.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# ../../blog/
# ../animal_kingdom/
# ../exercise_05/.rails_footnotes
# ../exercise_05/config/initializers/rails_footnotes.rb
# ../exercise_06/
# ../exercise_07/
# ../songs_database/
# ../stox/
# ../../lecture/
# ../../slideshow/
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/rails/labs/muzikdemo ✗ mp3 > git checkout cats
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'cats'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git merge mp3
Updating 3a4537f..60c340f
Fast-forward
 labs/muzikdemo/Gemfile                             |    2 +-
 labs/muzikdemo/Gemfile.lock                        |    4 ++
 labs/muzikdemo/app/models/dog.rb                   |    2 +-
 labs/muzikdemo/app/uploaders/music_uploader.rb     |   55 ++++++++++++++++++++
 labs/muzikdemo/app/views/dogs/_form.html.erb       |    4 +-
 labs/muzikdemo/app/views/dogs/show.html.erb        |    4 +-
 labs/muzikdemo/app/views/shared/_youtube.html.erb  |    1 +
 labs/muzikdemo/config/application.rb               |    2 +-
 labs/muzikdemo/db/schema.rb                        |   32 +++++++++++
 ..._40___feat._2Chainz__Drake__Kendrick_Lamar_.mp3 |  Bin 0 -> 9545273 bytes
 10 files changed, 99 insertions(+), 7 deletions(-)
 create mode 100644 labs/muzikdemo/app/uploaders/music_uploader.rb
 create mode 100644 labs/muzikdemo/app/views/shared/_youtube.html.erb
 create mode 100644 labs/muzikdemo/db/schema.rb
 create mode 100644 labs/muzikdemo/public/uploads/dog/song/1/01_Fuckin_Problem__prod._40___feat._2Chainz__Drake__Kendrick_Lamar_.mp3
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git branch -D mp3
Deleted branch mp3 (was 60c340f).
~/Dropbox/wdi/rails/labs/muzikdemo ✗ cats > git checkout master
M labs/exercise_04/app/controllers/home_controller.rb
M labs/exercise_04/app/views/home/getstocks.html.erb
M labs/exercise_04/config/routes.rb
M labs/exercise_05/Gemfile
M labs/exercise_05/Gemfile.lock
M labs/exercise_05/app/controllers/home_controller.rb
M labs/exercise_05/app/views/home/index.html.erb
M labs/moviez/config/routes.rb
Switched to branch 'master'
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git merge cats
Updating 8b3ddbe..60c340f
Fast-forward
 labs/muzikdemo/Gemfile                             |    2 +-
 labs/muzikdemo/Gemfile.lock                        |    4 +
 .../app/assets/javascripts/cats.js.coffee          |    3 +
 .../muzikdemo/app/assets/stylesheets/cats.css.scss |    3 +
 labs/muzikdemo/app/controllers/cats_controller.rb  |   83 ++++++++++++++++++++
 labs/muzikdemo/app/helpers/cats_helper.rb          |    2 +
 labs/muzikdemo/app/models/cat.rb                   |    3 +
 labs/muzikdemo/app/models/dog.rb                   |    2 +-
 labs/muzikdemo/app/uploaders/music_uploader.rb     |   55 +++++++++++++
 labs/muzikdemo/app/views/cats/_form.html.erb       |   29 +++++++
 labs/muzikdemo/app/views/cats/edit.html.erb        |    6 ++
 labs/muzikdemo/app/views/cats/index.html.erb       |   27 +++++++
 labs/muzikdemo/app/views/cats/new.html.erb         |    5 +
 labs/muzikdemo/app/views/cats/show.html.erb        |   20 +++++
 labs/muzikdemo/app/views/dogs/_form.html.erb       |    4 +-
 labs/muzikdemo/app/views/dogs/show.html.erb        |    4 +-
 labs/muzikdemo/app/views/shared/_youtube.html.erb  |    1 +
 labs/muzikdemo/config/application.rb               |    2 +-
 labs/muzikdemo/config/routes.rb                    |    3 +
 .../db/migrate/20121119183025_create_cats.rb       |   11 +++
 labs/muzikdemo/db/schema.rb                        |   32 ++++++++
 ..._40___feat._2Chainz__Drake__Kendrick_Lamar_.mp3 |  Bin 0 -> 9545273 bytes
 labs/muzikdemo/test/fixtures/cats.yml              |   11 +++
 .../test/functional/cats_controller_test.rb        |   49 ++++++++++++
 labs/muzikdemo/test/unit/cat_test.rb               |    7 ++
 .../test/unit/helpers/cats_helper_test.rb          |    4 +
 26 files changed, 365 insertions(+), 7 deletions(-)
 create mode 100644 labs/muzikdemo/app/assets/javascripts/cats.js.coffee
 create mode 100644 labs/muzikdemo/app/assets/stylesheets/cats.css.scss
 create mode 100644 labs/muzikdemo/app/controllers/cats_controller.rb
 create mode 100644 labs/muzikdemo/app/helpers/cats_helper.rb
 create mode 100644 labs/muzikdemo/app/models/cat.rb
 create mode 100644 labs/muzikdemo/app/uploaders/music_uploader.rb
 create mode 100644 labs/muzikdemo/app/views/cats/_form.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/edit.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/index.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/new.html.erb
 create mode 100644 labs/muzikdemo/app/views/cats/show.html.erb
 create mode 100644 labs/muzikdemo/app/views/shared/_youtube.html.erb
 create mode 100644 labs/muzikdemo/db/migrate/20121119183025_create_cats.rb
 create mode 100644 labs/muzikdemo/db/schema.rb
 create mode 100644 labs/muzikdemo/public/uploads/dog/song/1/01_Fuckin_Problem__prod._40___feat._2Chainz__Drake__Kendrick_Lamar_.mp3
 create mode 100644 labs/muzikdemo/test/fixtures/cats.yml
 create mode 100644 labs/muzikdemo/test/functional/cats_controller_test.rb
 create mode 100644 labs/muzikdemo/test/unit/cat_test.rb
 create mode 100644 labs/muzikdemo/test/unit/helpers/cats_helper_test.rb
~/Dropbox/wdi/rails/labs/muzikdemo ✗ master > git branch -D cats
Deleted branch cats (was 60c340f).

SASS:

Use separate css files for each part so you can each work on a part!


In application.css:
/*
 *= require 'reset'
 *= require 'dogs'
 *= require 'cats'
 */

 SASS

 does VARIABLES AND NESTING

