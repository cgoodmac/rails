rake assets:clean
rake assets:precompile

heroku create

git remote -v to see paths

git push heroku master

FOR ENV VARIABLES:

heroku config:add DATESTER=chris-datester

now you have to create the db on heroku. creates the production database

heroku run rake db:create

heroku run rake db:migrate

heroku run rake db:seed

TO MAKE CHANGES: