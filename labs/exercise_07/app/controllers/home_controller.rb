class HomeController < ApplicationController
  def index
  end

  def getquotes
    @stock = params[:stock].upcase
    number = params[:number].to_i
    @quotes = number.times.map{sleep 5; YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock)[@stock].lastTrade}

    total = @quotes.inject(:+)
    @average = total / number
  end

end