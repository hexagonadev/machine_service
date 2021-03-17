json.user do
  json.id @user.id
  json.name @user.name
  json.last_name @user.last_name
  json.email @user.email

  json.vehicles @user.vehicles do |vehicle|
    json.id vehicle.id
    json.brand vehicle.brand
    json.vin vehicle.vin
  end

  json.appointments @user.appointments do |appointment|
    json.id appointment.id
    json.user_id appointment.user_id
    json.vehicle_id appointment.vehicle_id
    json.date appointment.appointment_date
    json.description appointment.description
    json.status appointment.status
  end
end
