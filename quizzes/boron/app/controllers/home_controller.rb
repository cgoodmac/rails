class HomeController < ApplicationController

  def index

  end

  def place
    @place = Geocoder.search(params[:place])
    @lat = place[0].latitude
    @long = place[0].longitude
    @name = place[0].address
    
  end

end