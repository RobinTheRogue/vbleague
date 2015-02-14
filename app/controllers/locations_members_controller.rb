class LocationsMembersController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def create
    LocationMember.create({location_id: params[:id], member_id: params[:member_id]})
    flash[:notice] = "Contact added to this location!"
    redirect_to edit_location_path(params[:id])
  end

  def destroy
    location = Location.find(params[:id])
    member = location.members.find(params[:member_id])
    location.members.delete(member)
    flash[:notice] = "Contact removed from this location!"
    redirect_to edit_location_path(params[:id])
  end
end