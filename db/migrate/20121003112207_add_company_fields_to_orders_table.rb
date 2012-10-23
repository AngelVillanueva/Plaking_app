class AddCompanyFieldsToOrdersTable < ActiveRecord::Migration
  def change
    add_column :orders, :owner, :string
    add_column :orders, :company_address, :string
    add_column :orders, :cif, :string
  end
end
