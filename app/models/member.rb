class Member < ActiveRecord::Base
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :teams
  belongs_to :match

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :role

  def add_location(location_id)
    LocationMember.create({location_id: location_id, member_id: id})
  end

  def add_team(team_id)
    MemberTeam.create({member_id: id, team_id: team_id})
  end

end
