json.appointment @appointment.description
json.appointment_date @appointment.appointment_date
json.id @appointment.id
json.message "Cita creada"

# if @appointment.errors.any?
#   json.errors @appointment.errors.full_messages
# end