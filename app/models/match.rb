class Match < ActiveRecord::Base
  has_many :courts
  has_many :teams
  has_many :members
  has_and_belongs_to_many :results

  validates_presence_of :play_date, :start_time, :court_id,
                        :home_team_id, :away_team_id, :score_team_id

  def available_home_teams match_date
#    teams = Teams.all
#    teams.each do |team|
#      if Match.find_by_home_team_id(team.id).where(play_date: => match_date)
#        teams.delete(team)
#      end
#    end
  end

  def available_away_teams match_date

  end

  def available_scoring_teams match_date

  end

  def self.get_everything
    self.select('*').joins(:teams)
  end
end
