json.appointment do
  json.id @appointment.id
  json.description @appointment.description
  json.appointment_date @appointment.appointment_date
  json.user_id @appointment.user_id
  json.vehicle_id @appointment.vehicle_id

  if @appointment.errors.any?
    json.errors @appointment.errors.full_messages
  end
end
