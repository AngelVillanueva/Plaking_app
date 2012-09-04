class ChangeQuote < ActiveRecord::Migration
  def up
    add_column :quotes, :city, :string
  end

  def down
    remove_column :quotes, :city
  end
end
