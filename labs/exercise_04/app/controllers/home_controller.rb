class HomeController < ApplicationController
  def stock
  end

  def getstocks
    @stocks = params[:stocks].split(', ')
  end

  def result
  end
  
end