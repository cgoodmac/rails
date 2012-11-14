class HomeController < ApplicationController
  def start
  end

  def calc
    @name = params[:name]
  end
end
