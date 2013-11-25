# This migration comes from gko_core (originally 20130827061500)
class RemoveCountry < ActiveRecord::Migration
  def up
    drop_table :countries if table_exists?(:countries)
    drop_table :states if table_exists?(:states) 
    drop_table :liquid_models if table_exists?(:liquid_models)
  end

  def down

  end
end