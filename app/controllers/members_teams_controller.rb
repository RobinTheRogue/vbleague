class MembersTeamsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def create
    MemberTeam.create({member_id: params[:member_id], team_id: params[:id]})
    flash[:notice] = "Participant successfully added to team!"
    redirect_to edit_team_path(params[:id])
  end

  def destroy
    team = Team.find(params[:id])
    member = team.members.find(params[:member_id])
    team.members.delete(member)
    flash[:notice] = "Participant successfully removed from team!"
    redirect_to edit_team_path(params[:id])
  end
end