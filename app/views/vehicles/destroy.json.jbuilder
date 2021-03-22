if @vehicle.nil?
  json.message "Vehiculo no existe"
end

json.vehicle do
  json.brand @vehicle.brand
  json.model @vehicle.vin
  json.message "Eliminado"

  if @vehicle.errors.any?
    json.errors @vehicle.errors.full_messages
  end
end
