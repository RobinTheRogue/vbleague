class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name

      t.string :phone
      t.string :email
      t.integer :notification

      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :addresstype

      t.string :role

      t.timestamps null: false
    end
  end
end
