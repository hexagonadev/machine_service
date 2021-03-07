json.vehicle @vehicle, :brand, :model, :engine_size, :year, :color, :vin, :kind
json.message "Vehiculo añadido"
if @vehicle.errors.any?
  json.error @vehicle.errors.full_messages
end