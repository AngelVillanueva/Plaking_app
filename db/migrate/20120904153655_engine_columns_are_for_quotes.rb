class EngineColumnsAreForQuotes < ActiveRecord::Migration
  def up
    add_column :quotes, :cc_engine, :Integer
    add_column :quotes, :number_cylinders, :Integer
    add_column :quotes, :stroke, :Integer
  end

  def down
    remove_column :quotes, :cc_engine
    remove_column :quotes, :number_cylinders
    remove_column :quotes, :stroke
  end
end
