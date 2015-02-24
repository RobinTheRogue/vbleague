class ContactspageController < ApplicationController
  def index
    @teams = Team.order(name: :asc)
  end
end
