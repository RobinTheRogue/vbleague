class Division < ActiveRecord::Base
  belongs_to :team

  validates_uniqueness_of :name
  validates_presence_of :name
end
