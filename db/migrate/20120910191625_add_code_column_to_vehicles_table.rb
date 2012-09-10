class AddCodeColumnToVehiclesTable < ActiveRecord::Migration
  def change
    add_column :vehicles, :code, :string
  end
end
