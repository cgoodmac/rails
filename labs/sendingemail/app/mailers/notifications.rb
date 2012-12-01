class Notifications < ActionMailer::Base
  default from: "cgoodmac@gmail.com"

  def welcome(user)
    @user = user
    @greeting = "Hi"

    mail to: "cgoodmac@gmail.com", :subject => "Welcome to pirate mail, arr"
  end

  def logoff
    @greeting = "Hi"

    mail to: "cgoodmac@gmail.com", :subject => "I noticed you logged off, this is not creepy"
  end
end
