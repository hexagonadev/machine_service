json.vehicle do

  json.id @vehicle.id
  json.user_id @vehicle.user_id
  json.kind @vehicle.kind
  json.brand @vehicle.brand
  json.model @vehicle.model
  json.engine_size @vehicle.engine_size
  json.color @vehicle.color
  json.year @vehicle.year
  json.vin @vehicle.vin

  if @vehicle.errors.any?
    json.errors @vehicle.errors.full_messages
  end

end
