class AddAppointmentRefs < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :appointments, :users
    add_foreign_key :appointments, :vehicles
  end
end
