class Quote < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.name :string
      t.integer :state_id
            
      t.timestamps
    end
  end
end
