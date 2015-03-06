class MatchesController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @matches = Match.order(start_time: :asc)
    @match_dates = Match.select(:play_date).order(play_date: :asc).distinct
    @courts = Court.joins(:location)
    @teams = Team.all
    @refs = Member.where("(role = 'Referee')")
    @levels = Level.all
  end

  def show
    @match = Match.find(params[:id])
    @location = Court.find(@match.court_id).location
    @home_team = Team.find(@match.home_team_id)
    @away_team = Team.find(@match.away_team_id)
    @score_team = Team.find(@match.score_team_id)
    @up_ref = Team.find(@match.up_ref_id)
    @dn_ref = Team.find(@match.dn_ref_id)
  end

  def edit
    @match = Match.find(params[:id])
    @courts = Court.all
    @teams = Team.all
    @refs = Member.where("(role = 'Referee')")
    @levels = Level.all
  end

  def new
    @match = Match.new
    @location = Location.all
    @courts = Court.all
    @teams = Team.all
    @refs = Member.where("(role = 'Referee')")
    @levels = Level.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "Match successfully created!"
      redirect_to matches_path
    else
      flash[:danger] = @match.errors.full_messages.to_sentence
      redirect_to new_match_path
    end
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:success] = "Match successfully updated!"
      redirect_to matches_path
    else
      flash[:danger] = @match.errors.full_messages.to_sentence
      redirect_to edit_match_path(params[:id])
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    flash[:danger] = "Match successfully removed!"
    redirect_to @match
  end

private
  def match_params
    params.require(:match).permit(:play_date, :court_id, :home_team_id,
           :away_team_id, :score_team_id, :start_time, :up_ref_id, :dn_ref_id,
           :level_id)
  end

end
