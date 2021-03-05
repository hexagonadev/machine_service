json.vehicle do
  json.id @vehicle.id
  json.brand @vehicle.brand
  json.model @vehicle.model
  json.engine_size @vehicle.engine_size
  json.year @vehicle.year
  json.color @vehicle.color
  json.vin @vehicle.vin
  json.kind @vehicle.kind
  json.user_id @vehicle.user_id
end