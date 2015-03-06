class SitesController < ApplicationController

  def index
    @locations = Location.order(name: :asc)
  end

end
