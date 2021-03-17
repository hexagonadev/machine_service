class RenameColumnToVehicle < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :king, :kind
    rename_column :vehicles, :module, :model
  end
end
