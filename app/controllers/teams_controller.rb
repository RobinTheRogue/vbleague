class TeamsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @teams = Team.order(name: :asc)
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
    @coaches = Member.where("(role = 'Coach')").order(last_name: :asc)
    @advocates = Member.where("(role = 'Advocate')").order(last_name: :asc)
    @players = Member.where("(role = 'Player')").order(last_name: :asc)
  end

  def new
    @team = Team.new
    @level = Level.all
    @division = Division.all
    @location = Location.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team successfully created!"
      redirect_to teams_path
    else
      flash[:danger] = @team.errors.full_messages.to_sentence
      redirect_to new_team_path
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success] = "Team successfully updated!"
      redirect_to edit_team_path(params[:id])
    else
      flash[:danger] = @team.errors.full_messages.to_sentence
      redirect_to edit_team_path(params[:id])
    end
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
