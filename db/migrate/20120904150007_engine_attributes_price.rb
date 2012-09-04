class EngineAttributesPrice < ActiveRecord::Migration
  def up
    add_column :prices, :cc_engine, :Integer
    add_column :prices, :number_cylinders, :Integer
    add_column :prices, :stroke, :Integer
  end

  def down
    remove_column :prices, :cc_engine
    remove_column :prices, :number_cylinders
    remove_column :prices, :stroke
  end
end
