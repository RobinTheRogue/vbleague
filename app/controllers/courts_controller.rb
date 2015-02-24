class CourtsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def create
    Court.create({name: params[:court_name], location_id: params[:id]})
    flash[:success] = "Court added to this location!"
    redirect_to edit_location_path(params[:id])
  end

  def destroy
    location = Location.find(params[:id])
    court = location.courts.find(params[:court_id])
    location.courts.delete(court)
    flash[:danger] = "Court removed from this location!"
    redirect_to edit_location_path(params[:id])
  end

end
