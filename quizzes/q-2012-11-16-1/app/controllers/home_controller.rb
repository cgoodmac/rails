class HomeController < ApplicationController
  def start
  end

  def calc
    @number = params[:number].to_i
  end
end