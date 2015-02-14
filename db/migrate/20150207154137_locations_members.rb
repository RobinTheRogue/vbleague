class LocationsMembers < ActiveRecord::Migration
  def change
    create_table :locations_members, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :member, index: true
    end
  end
end
