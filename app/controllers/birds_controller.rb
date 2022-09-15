class BirdsController < ApplicationController

  def show 
    @bird = Bird.find(params[:id])
  end

  def index
    @birds = Bird.all
  end

  def new 
    @bird = Bird.new
  end

  def create
    @bird = Bird.new(params.require(:bird).permit(:title))
    if @bird.save
      flash[:notice] = "Article was created successfully."
      redirect_to bird_path(@bird)
    else
      render 'new'
    end
  end

end