class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end

  def new
  end
  
  def create
    # raise params.inspect
    movie_name = params[:name]
    poster = params[:poster] #rails converts symbol to string and vice versa
    Movie.create(:name => movie_name, :poster => poster)
    redirect_to movies_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.delete
    redirect_to movies_path
  end

end