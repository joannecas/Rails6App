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

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    @bird = Bird.find(params[:id])
    if @bird.update(params.require(:bird).permit(:title))
      flash[:notice] = "Bird reference was updated successfully."
      redirect_to @bird
    else
      render 'edit'
    end
  end

  def create
    @bird = Bird.new(params.require(:bird).permit(:title))
    if @bird.save
      flash[:notice] = "Bird reference was created."
      redirect_to @bird
    else
      render 'new'
    end
  end

  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy
    redirect_to birds_path
  end

end