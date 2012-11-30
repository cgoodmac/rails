class PlaceController < ApplicationController

  def place

    search_terms = params[:place]
    search_result = Geocoder.search(search_terms)
    place = search_result[0]

    @lat = place.latitude
    @long = place.longitude
    @name = place.address

  end

end