class AddVehicle < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :engine_size
      t.string :year
      t.string :color
      t.string :vin

      t.timestamps
    end
  end
end
