class Location < ActiveRecord::Base
  has_and_belongs_to_many :members
  has_many :courts, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

end