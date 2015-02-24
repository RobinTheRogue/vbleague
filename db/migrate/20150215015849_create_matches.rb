class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :play_date, null: false, index: true
      t.string :start_time, null: false
      t.integer :court_id, null: false
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false
      t.integer :score_team_id, null: false
      t.integer :up_ref_id
      t.integer :dn_ref_id

      t.timestamps null: false
    end
  end
end
