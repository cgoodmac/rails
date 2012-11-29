class Notifications < ActionMailer::Base
  default from: "cgoodmac@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.message.subject
  #
  def hi(email, message)
    @email = email
    @message = message

    @greeting = "Hi"
    mail to: "#{@email}", :subject => "You have a message: #{@message}"
  end
end
