class Court < ActiveRecord::Base
  belongs_to :location

  validates_uniqueness_of :name
  validates_presence_of :name
end
