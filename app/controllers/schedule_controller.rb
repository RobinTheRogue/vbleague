class ScheduleController < ApplicationController

  def index
    @matches = Match.where(level_id: params[:id]).order(start_time: :asc)
    @match_dates = Match.select(:play_date).order(play_date: :asc).distinct
    @courts = Court.joins(:location)
    @teams = Team.all
    @refs = Member.where("(role = 'Referee')")
    level = Level.find(params[:id])
    @level_name = level.name
  end

end
