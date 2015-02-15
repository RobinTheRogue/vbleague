class MemberTeam < ActiveRecord::Base
  self.table_name = 'members_teams'

  validates_presence_of :member_id
  validates_presence_of :team_id
end
