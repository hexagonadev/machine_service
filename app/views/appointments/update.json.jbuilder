json.appointment do
  json.id @appointment.id
  json.user_id appointment.user_id
  json.vehicle_id appointment.vehicle_id
  json.date appointment.date
  json.description appointment.description
  json.status appointment.status
end