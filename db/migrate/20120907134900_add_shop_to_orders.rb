class AddShopToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :shop, :string
  end
  def down
    remove_column :orders, :shop
  end
end
