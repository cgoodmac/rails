class TwilioController < ApplicationController
  def new

  end

  def create
    from_phone = "+19175208422"
    to_phone = params[:phone]
    txt = params[:textmessage]

    client = Twilio::REST::Client.new(TW_SID, TW_TOK) # need to put codes in initializers file
     @message  = client.account.sms.messages.create({:from => from_phone, :to => to_phone, :body => txt})
    redirect_to twilio_path
  end
end