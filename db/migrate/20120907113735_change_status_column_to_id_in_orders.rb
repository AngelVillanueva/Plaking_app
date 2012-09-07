class ChangeStatusColumnToIdInOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :status
    add_column :orders, :status_id, :integer
  end

  def down
    remove_column :orders, :status_id
    add_column :orders, :status, :string
  end
end
