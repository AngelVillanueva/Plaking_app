class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :String
    add_index :users, :remember_token
  end
end
