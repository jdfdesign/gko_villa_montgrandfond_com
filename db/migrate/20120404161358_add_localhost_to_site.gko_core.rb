# This migration comes from gko_core (originally 20120326000000)
# This migration comes from gko_core (originally 20120326000000)
class AddLocalhostToSite < ActiveRecord::Migration
  def up
    add_column :sites, :localhost, :string unless column_exists?(:sites, :localhost) 
  end
  
  def down
    remove_column :sites, :localhost
  end
end