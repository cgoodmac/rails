class HomeController < ApplicationController
  def index
  end

  def movies
    @movies = params[:movies].split(', ')
  end
end