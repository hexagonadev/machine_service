json.appointment do
  json.id @appointment.id
  json.user_id @appointment.user_id
  json.vehicle_id @appointment.vehicle_id
  json.date @appointment.appointment_date
  json.description @appointment.description
  json.status @appointment.status

  json.vehicle "Cita eliminada con exito"

  if @appointment.errors.any?
    json.errors @appointment.errors.full_messages
  end
end