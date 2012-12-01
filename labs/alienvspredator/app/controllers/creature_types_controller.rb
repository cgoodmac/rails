class CreatureTypesController < ApplicationController
  def index
    @creature_types = CreatureType.page(params[:page])
  end

  def create
    name = params[:name]
    @ct = CreatureType.create(:name => name)
  end

  def show
    id = params[:id]
    @creaturetype = CreatureType.find(id)
  end

  def search
    name = params[:name]
    @creature_types = CreatureType.where(:name => name)
  end
end