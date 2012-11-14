class HomeController < ApplicationController
  def stock
  end

  def getstocks
    @stocks = params[:stocks]
    @stocks_split = @stocks.split(', ')
    raise @stocks_split.inspect
  end

  def result
  end
  
end