class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :season
      t.integer :level_id
      t.integer :division_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
