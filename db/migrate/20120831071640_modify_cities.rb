class ModifyCities < ActiveRecord::Migration
  def up
    add_column :cities, :state_id, :integer
    add_index :cities, :state_id
  end

  def down
    remove_index :cities, :state_id
    remove_column :cities, :state_id
  end
end
