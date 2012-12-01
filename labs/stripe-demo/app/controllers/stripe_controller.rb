class StripeController < ApplicationController
  def new

  end

  def create
    # Paramaters from log in bash: Parameters: {"utf8"=>"tok_0oqsupQ3XCsIUA", "authenticity_token"=>"tok_0oqsupQ3XCsIUA", "amount"=>"500", "token"=>"tok_0oqsupQ3XCsIUA"}
    amount = params[:amount].to_i * 100 #converts amount to dollars, to_f converts to floating pt
    token = params[:token]

    begin
      @stripe = Stripe::Charge.create(
        :amount => amount,
        :card   => token,
        :description => 'Rails Stripe customer',
        :currency => 'usd'
      )
    rescue => e
      @error = e.message
    end

  end
end