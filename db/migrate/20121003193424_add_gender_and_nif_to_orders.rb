class AddGenderAndNifToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :gender, :integer # 1 is for men, 2 for women
    add_column :orders, :nif, :string
  end
end
