class Court < ActiveRecord::Base
  belongs_to :location
  belongs_to :matches

  validates_presence_of :name

  def self.get_courts
    courts = self.all
    courts.each do |court|
      full_courts = Location.find(court.location_id)
    end
  end
end
