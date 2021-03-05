class CreateVehicle < ActiveRecord::Migration[6.1]
  def change
      create_table :vehicles do |t|
        t.string :brand
        t.string :model
        t.string :engine_size
        t.integer :year
        t.string :color
        t.string :vin
        t.string :kind

        t.timestamps
      end
  end
end
