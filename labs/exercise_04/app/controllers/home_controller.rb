class HomeController < ApplicationController
  def stock
  end

  def getstocks
    symbols = params[:stocks].upcase.split(', ')
    @stocks = symbols.map{|symbol| YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol] }
  end

  def result
  end
  
end