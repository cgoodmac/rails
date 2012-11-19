class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    song_id = params[:id]
    @song = Song.find(song_id)
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id]) #id is in the url, find it in the database

  end 

  def create
    @song = Song.new(params[:song])

    if @song.save
      redirect_to songs_path # if saved, go to index page see validation in models/Song.rb
    else
      render :new # this does not mean it goes to the function new above. it just shows the html!!!! takes you back to the form
    end

  end

  def update
    @song = Song.find(params[:id])
    
    if @song.update_attributes(params[:song]) #lets you do mass assignment
      redirect_to @song # that is a shortcut to the url to that specific Song. if you just show it, it automatically transforms the thing to the show page
    else
      render :edit
    end
  end

  def destroy
    Song = Song.find(params[:id])
    Song.delete
    redirect_to Songs_path
  end
end  