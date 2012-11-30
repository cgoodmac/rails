class HomeController < ApplicationController

  def index

  end

  def place
    binding.pry
    place = Geocoder.search(params[:place])
    lat = place[0].latitude
    long = place[0].longitude
    name = place[0].address

    @location.name = name
    @location.lat = lat
    @location.long = long

  end

end