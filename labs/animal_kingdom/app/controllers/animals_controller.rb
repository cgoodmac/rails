class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    animal_id = params[:id]
    @animal = Animal.find(animal_id)
  end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = Animal.find(params[:id]) #id is in the url, find it in the database

  end 

  def create
    @animal = Animal.new(params[:animal])

    if @animal.save
      redirect_to animals_path # if saved, go to index page see validation in models/animal.rb
    else
      render :new # this does not mean it goes to the function new above. it just shows the html!!!! takes you back to the form
    end

  end

  def update
    @animal = Animal.find(params[:id])
    
    if @animal.update_attributes(params[:animal]) #lets you do mass assignment
      redirect_to @animal # that is a shortcut to the url to that specific animal. if you just show it, it automatically transforms the thing to the show page
    else
      render :edit
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.delete
    redirect_to animals_path
  end
end  