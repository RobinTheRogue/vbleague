class LevelsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
  end

  def new
    @level = Level.new
  end

  def create
    level_params = params.require(:level).permit(:name)
    @level = Level.new(level_params)
    if @level.save
      flash[:success] = "Level successfully added!"
      redirect_to levels_path
    else
      flash[:danger] = @level.errors.full_messages.to_sentence
      render new_level_path
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    level_params = params.require(:level).permit(:name)
    if @level.update(level_params)
      flash[:success] = "Level successfully updated!"
      redirect_to levels_path
    else
      flash[:danger] = @level.errors.full_messages.to_sentence
      render new_level_path
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    flash[:danger] = "Level deleted!"
    redirect_to @level
  end
end
