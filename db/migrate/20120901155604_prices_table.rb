class PricesTable < ActiveRecord::Migration
  def up
    create_table :prices do |t|
      t.integer :type_id
      t.integer :city_id
      t.decimal :price
      t.integer :year
      
      t.timestamps
    end
    add_index :prices, [:type_id, :city_id, :year]
  end

  def down
    drop_table :prices
  end
end
