class BirdsController < ApplicationController

  def show 
    @bird = Bird.find(params[:id])
  end

  def index
    @birds = Bird.all
  end

  def new 
  end

  def create
  end

end