class AddVehiclesColumnsToQuoteConceptsTable < ActiveRecord::Migration
  def change
    add_column :quote_concepts, :for_car, :boolean, default: true
    add_column :quote_concepts, :for_ciclo, :boolean, default: true
    add_column :quote_concepts, :for_moto, :boolean, default: true
  end
end
