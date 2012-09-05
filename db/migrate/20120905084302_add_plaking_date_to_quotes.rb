class AddPlakingDateToQuotes < ActiveRecord::Migration
  def up
    add_column :quotes, :plaking_date, :date
  end
  
  def down
    remove_column :quotes, :plaking_date
  end
end
