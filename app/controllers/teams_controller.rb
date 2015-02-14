class TeamsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @teams = Team.order(name: :desc)
  end

  def show
    @team = Team.find(params[:id])
    @level = Level.find(@team.level_id)
    @division = Division.find(@team.division_id)
    @location = Location.find(@team.location_id)
  end

  def edit
    @team = Team.find(params[:id])
    @level = Level.all
    @division = Division.all
    @location = Location.all
    @assigned_coaches = @team.members.where("(role = 'Coach')")
    @assigned_advocates = @team.members.where("(role = 'Advocate')")
    @assigned_players = @team.members.where("(role = 'Player')")
    @coaches = Member.where("(role = 'Coach')")
    @advocates = Member.where("(role = 'Advocate')")
    @players = Member.where("(role = 'Player')")
  end

  def new
    @team = Team.new
    @level = Level.all
    @division = Division.all
    @location = Location.all
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to @team
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    flash[:notice] = "Team successfully updated!"
    redirect_to edit_team_path(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to @team
  end

private
  def team_params
    params.require(:team).permit(:name, :level_id, :division_id,
           :location_id, :season)
  end

end
