class HomeController < ApplicationController

  def index

  end

  def message
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]

    # if no email, then phone
    if @email == ""
      from_phone = "+19175125826"

      client = Twilio::REST::Client.new(TW_SID, TW_TOK) # need to put codes in initializers file
      @text  = client.account.sms.messages.create({:from => from_phone, :to => @phone, :body => @message})
      @return_message = "Your TEXT has been sent!"
    
    else

    Notifications.hi(@email, @message).deliver
    @return_message = "Your EMAIL has been sent!"
    
    end

  end

end