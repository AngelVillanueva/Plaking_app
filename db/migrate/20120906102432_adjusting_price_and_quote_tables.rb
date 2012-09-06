class AdjustingPriceAndQuoteTables < ActiveRecord::Migration
  def up
    remove_column :prices, :cc_engine
    remove_column :prices, :number_cylinders
    remove_column :prices, :stroke
    remove_column :quotes, :state_id
    remove_column :quotes, :city
    remove_column :quotes, :vehicle
  end
end
