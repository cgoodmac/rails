class HomeController < ApplicationController
  
  def index

  end

  def url
    url = params[:url]
    data = HTTParty.get(url)
    words = data.split
    @t = Tree.new

    words.each do |word|
      @t.insert(word)
    end

    @t.sort

  end
end