class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :edit, :update, :destroy]

  def show 
    set_bird
  end

  def index
    @birds = Bird.all
  end

  def new 
    @bird = Bird.new
  end

  def edit
    set_bird
  end

  def update
    set_bird
    if @bird.update(bird_params)
      flash[:notice] = "#{@bird.title} reference was updated successfully."
      redirect_to @bird
    else
      render 'edit'
    end
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      flash[:notice] = "#{@bird.title} reference was created."
      redirect_to @bird
    else
      render 'new'
    end
  end

  def destroy
    set_bird
    @bird.destroy
    flash[:notice] = "#{@bird.title} reference was removed."
    redirect_to birds_path
  end

  private
  def set_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:title)
  end

end