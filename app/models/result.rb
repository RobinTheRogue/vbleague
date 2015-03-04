class Result < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :matches

  validates_presence_of :team_id
  validates_presence_of :match_id
end
