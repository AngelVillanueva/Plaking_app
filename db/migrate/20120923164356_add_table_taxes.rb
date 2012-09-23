class AddTableTaxes < ActiveRecord::Migration
  def up
    create_table :taxes do |t|
      t.string :symbol
      t.decimal :percentage, precision: 10, scale: 2
      
      t.timestamps
    end
  end

  def down
    drop_table :taxes
  end
end
