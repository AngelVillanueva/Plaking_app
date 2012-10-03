class AddRegisteredNameColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :registered_name, :string
  end
end
