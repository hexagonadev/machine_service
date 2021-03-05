json.vehicle @vehicle, :brand, :model, :vin
json.message "eliminado"

if @vehicle.errors.any?
  json.error @vehicle.errors.full_messages
end