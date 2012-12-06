class HomeController < ApplicationController
  
  def index

  end

  def url
    url = params[:url]
    data = HTTParty.get(url)
    @words = data.split
   
  end

end