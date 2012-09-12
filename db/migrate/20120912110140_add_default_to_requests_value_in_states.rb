class AddDefaultToRequestsValueInStates < ActiveRecord::Migration
  def change
    change_column :states, :requests, :integer, default: 0
  end
end
