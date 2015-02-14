class MembersTeams < ActiveRecord::Migration
  def change
    create_table :members_teams, id: false do |t|
      t.belongs_to :member, index: true
      t.belongs_to :team, index: true
    end
  end
end
