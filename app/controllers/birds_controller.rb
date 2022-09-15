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
    @bird = Bird.new(params.require(:bird).permit(:title))
    @bird.save
    redirect_to bird_path(@bird)
  end

end