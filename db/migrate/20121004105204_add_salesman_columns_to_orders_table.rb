class AddSalesmanColumnsToOrdersTable < ActiveRecord::Migration
  def change
    add_column :orders, :shop_salesman, :string
    add_column :orders, :shop_phone, :string
  end
end
