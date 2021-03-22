json.appointment @appointment, :description, :appointment_date, :id, :user_id, :vehicle_id

if @appointment.errors.any?
  json.errors @appointment.errors.full_messages
end