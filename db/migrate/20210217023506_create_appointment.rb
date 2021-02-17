class CreateAppointment < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :description
      t.string :appointment_date
      t.string :vehicle_id
      t.string :user_id

      t.timestamps
    end
  end
end
