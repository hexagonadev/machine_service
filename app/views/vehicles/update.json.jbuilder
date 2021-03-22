json.extract! @vehicle, :id, :brand, :model, :engine_size, :year, :color, :vin, :kind, :user_id

if @vehicle.errors.any?
  json.errors @vehicle.errors.full_messages
end