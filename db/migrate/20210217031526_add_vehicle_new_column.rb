class AddVehicleNewColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :user_id, :string
  end
end
