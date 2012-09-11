class AddAmountToQuotesTable < ActiveRecord::Migration
  def change
    add_column :quotes, :amount, :decimal, precision: 10, scale: 3
  end
end
