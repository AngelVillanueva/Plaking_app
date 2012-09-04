class ChangePriceTable < ActiveRecord::Migration
  def up
    rename_column :prices, :type_id, :vehicle_id
  end

  def down
    rename_column :prices, :vehicle_id, :type_id
  end
end
