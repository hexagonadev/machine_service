class AddUserAndVehicleRefToAppointment < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :user_id, :bigint, null: false, foreign_key: true
    change_column :appointments, :vehicle_id, :bigint, null: false, foreign_key: true

  end
end
