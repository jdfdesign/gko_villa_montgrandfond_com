# This migration comes from gko_core (originally 20121110919411)
class AddFrontPageCachedToSite < ActiveRecord::Migration
  def up
    add_column :sites, :front_page_cached, :boolean, :default => false unless column_exists?(:sites, :front_page_cached)
  end

  def down
    remove_column :sites, :front_page_cached
  end
end