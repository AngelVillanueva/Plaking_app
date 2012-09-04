class ChangePricePrecision < ActiveRecord::Migration
  def up
    change_column :prices, :price, :decimal, precision: 2
  end

  def down
  end
end
