class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :name
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
