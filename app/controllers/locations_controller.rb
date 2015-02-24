class LocationsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @locations = Location.order(name: :asc)
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
    @contacts = @location.members
    @members = Member.where("(role = 'Coach') OR (role = 'Advocate')").order(last_name: :asc)
    @courts = @location.courts
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location successfully added!"
      redirect_to locations_path
    else
      flash[:danger] = @location.errors.full_messages.to_sentence
      render new_location_path
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:success] = "Location successfully updated!"
      redirect_to edit_location_path(params[:id])
    else
      flash[:danger] = @location.errors.full_messages.to_sentence
      redirect_to edit_location_path(params[:id])
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:danger] = "The location has been removed!"
    redirect_to @location
  end

private
  def location_params
    params.require(:location).permit(:name, :street, :city, :state, :zip, :url, :notes)
  end

end
