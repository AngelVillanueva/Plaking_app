class AddShopEmailToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shop_email, :string
  end
end
