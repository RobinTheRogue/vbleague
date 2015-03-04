class Team < ActiveRecord::Base
  has_one :level
  has_one :division
  has_one :location
  has_and_belongs_to_many :members
  belongs_to :matches
  has_and_belongs_to_many :results

  validates :name, presence: true, uniqueness: true
  validates_presence_of :level_id, :division_id, :location_id, :season
end
