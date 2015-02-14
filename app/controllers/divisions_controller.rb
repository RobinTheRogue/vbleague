class DivisionsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @divisions = Division.all
  end

  def show
    @division = Division.find(params[:id])
  end

  def new
    @division = Division.new
  end

  def create
    division_params = params.require(:division).permit(:name)
    @division = Division.new(division_params)
    if @division.save
      flash[:notice] = "Division successfully added!"
      redirect_to divisions_path
    else
      flash[:notice] = @division.errors.full_messages.to_sentence
      render new_division_path
    end
  end

  def edit
    @division = Division.find(params[:id])
  end

  def update
    @division = Division.find(params[:id])
    division_params = params.require(:division).permit(:name)
    if @division.update(division_params)
      flash[:notice] = "Division successfully updated!"
      redirect_to divisions_path
    else
      flash[:notice] = @division.errors.full_messages.to_sentence
      render edit_division_path
    end
  end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    flash[:notice] = "Division deleted!"
    redirect_to @division
  end
end
