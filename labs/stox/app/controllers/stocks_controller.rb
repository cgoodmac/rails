class StocksController < ApplicationController
  def index
  end  

  def new
    @stock = Stock.new

  end

  def create
    raise params.inspect
  end



end  