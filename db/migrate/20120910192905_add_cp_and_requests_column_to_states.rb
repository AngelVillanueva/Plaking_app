class AddCpAndRequestsColumnToStates < ActiveRecord::Migration
  def change
    add_column :states, :cp_prefix, :string
    add_column :states, :requests, :integer
  end
end
