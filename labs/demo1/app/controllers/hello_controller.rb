class HelloController < ApplicationController
  def world
    render :text => "hello world!!!"
  end
  def chris
    render :text => "Goodmacher"
  end
  def dogs
    render :text => "cats"
  end
  def ruby
    render :text => "rails"
  end
end