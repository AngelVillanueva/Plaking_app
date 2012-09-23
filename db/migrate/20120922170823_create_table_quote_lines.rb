class CreateTableQuoteLines < ActiveRecord::Migration
  def up
    create_table :quote_lines do |t|
      t.string :symbol
      t.decimal :net_amount, precision: 10, scale: 2
      t.integer :tax_id
      t.boolean :show_before
      
      t.timestamps
    end
  end

  def down
    drop_table :quote_lines
  end
end
