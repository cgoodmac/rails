class HomeController < ApplicationController

  def index

  end

  def calc
    @name = params[:name]
    @length = @name.length
  end
end