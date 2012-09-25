class AddOrderToQuoteConcepts < ActiveRecord::Migration
  def change
    add_column :quote_concepts, :ordering, :integer
  end
end
