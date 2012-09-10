class AddTimestampsToCitiesTable < ActiveRecord::Migration
  def change
    add_column :cities, :created_at, :datetime
    add_column :cities, :updated_at, :datetime
  end
end
