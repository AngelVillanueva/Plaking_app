class ChangeNameToQuoteLinesTable < ActiveRecord::Migration
  def up
    rename_table :quote_lines, :quote_concepts
  end

  def down
  rename_table :quote_concepts, :quote_lines
  end
end
