class VehicleTable < ActiveRecord::Migration
  def up
    create_table :vehicles do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def down
    drop_table :vehicles
  end
end
