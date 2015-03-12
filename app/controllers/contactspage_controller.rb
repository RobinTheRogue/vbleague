class ContactspageController < ApplicationController
  def index
    @teams = Team.order(name: :asc)
    @coaches = Member.order(last_name: :asc).where("(role = 'Coach')")
    @advocates = Member.order(last_name: :asc).where("(role = 'Advocate')")
    @refs = Member.order(last_name: :asc).where("(role = 'Referee')")
  end
end
