class CreateAppointment < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.text :description
      t.integer :status
      t.integer :vehicle_id
      t.integer :user_id

      t.timestamps
    end
  end
end
