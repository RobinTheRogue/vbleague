class ContactsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to edit_location_path(params[:contact][:location_id])
  end

  private
  def contact_params
    params.require(:contact).permit(:location_id, :member_id)
  end

end
