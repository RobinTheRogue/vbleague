class Location < ActiveRecord::Base
  has_and_belongs_to_many :members
  has_many :courts, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def add_member(member_id)
    LocationMember.create({location_id: id, member_id: member_id})
  end

  # TODO: add a DESTORY or REMOVE method
end