class AddVehicleToQuotes < ActiveRecord::Migration
  def up
    add_column :quotes, :vehicle, :string
  end
  def down
    remove_column :quotes, :vehicle
  end
end
