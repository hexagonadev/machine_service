json.vehicle @vehicle, :brand, :model, :engine_size, :year, :color, :vin, :kind, :id
json.message "Vehiculo añadido"
if @vehicle.errors.any?
  json.errors @vehicle.errors.full_messages
end