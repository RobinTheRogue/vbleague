class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :team_id, null: false
      t.integer :match_id, null: false
      t.integer :game_one
      t.integer :game_two
      t.integer :game_three
      t.integer :game_four
      t.integer :game_five
      t.boolean :winner, default: false
      t.boolean :divisionPlay, default: false

      t.timestamps null: false
    end
  end
end
