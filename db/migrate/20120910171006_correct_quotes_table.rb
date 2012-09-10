class CorrectQuotesTable < ActiveRecord::Migration
  def up
    add_column :quotes, :city_id, :integer
    add_column :quotes, :vehicle_id, :integer
  end

  def down
	  remove_column :quotes, :city_id
	  remove_column :quotes, :vehicle_id
  end
end
