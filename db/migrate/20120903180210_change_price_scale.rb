class ChangePriceScale < ActiveRecord::Migration
  def up
    change_column :prices, :price, :decimal, precision: 10, scale: 3
  end

  def down
  end
end
