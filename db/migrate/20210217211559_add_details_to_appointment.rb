class AddDetailsToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :appointment_date, :date
  end
end
