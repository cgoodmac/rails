HEROKU

~/Dropbox/wdi/group/foodee ✗ master > heroku login
Enter your Heroku credentials.
Email: cgoodmac@gmail.com
Password (typing will be hidden): 
Could not find an existing public key.
Would you like to generate one? [Yn] y
Generating new SSH public key.
Uploading SSH public key /Users/cgoodmac/.ssh/id_rsa.pub... done
Authentication successful.
~/Dropbox/wdi/group/foodee ✗ master > git add .
~/Dropbox/wdi/group/foodee ✗ master > git commit -m "making sure pre heroku"
# On branch master
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
# deleted:    public/index.html
#
no changes added to commit (use "git add" and/or "git commit -a")
~/Dropbox/wdi/group/foodee ✗ master > git push origin master
Username for 'github.com': 
Password for 'github.com': 
Everything up-to-date
~/Dropbox/wdi/group/foodee ✗ master > heroku create
Creating sleepy-lake-7667... done, stack is cedar
http://sleepy-lake-7667.herokuapp.com/ | git@heroku.com:sleepy-lake-7667.git
Git remote heroku added
~/Dropbox/wdi/group/foodee ✗ master > git remote -v
heroku  git@heroku.com:sleepy-lake-7667.git (fetch)
heroku  git@heroku.com:sleepy-lake-7667.git (push)
origin  https://github.com/cgoodmac/foodee.git (fetch)
origin  https://github.com/cgoodmac/foodee.git (push)
~/Dropbox/wdi/group/foodee ✗ master > 

~/Dropbox/wdi/group/foodee ✗ master > git commit -am "committing deleted files"

~/Dropbox/wdi/group/foodee ✗ master > git push heroku master

~/Dropbox/wdi/group/foodee ✗ master > heroku run rake db:create

~/Dropbox/wdi/group/foodee ✗ master > heroku run rake db:migrate

COUNT LINES TO CHECK ASSOCIATIONS

you can say r1.receipts and find all receipts
r1.dishes - find all dishes the restaurant

receipt.orders = see all the orders

create a UI for creating orders

GIT BRANCHES

git branch "name" => creates a branch
git branch => shows branches
git checkout receipt => switch branch
work on your branch locally only
when you want to merge do
git merge receipt
