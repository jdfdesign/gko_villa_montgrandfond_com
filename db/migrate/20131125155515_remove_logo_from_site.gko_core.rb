# This migration comes from gko_core (originally 20130919042500)
class RemoveLogoFromSite < ActiveRecord::Migration
  def change
    remove_column :sites, :logo_mime_type if ActiveRecord::Base.connection.column_exists?(:sites, :logo_mime_type)
    remove_column :sites, :logo_name if ActiveRecord::Base.connection.column_exists?(:sites, :logo_name)
    remove_column :sites, :logo_size if ActiveRecord::Base.connection.column_exists?(:sites, :logo_size)
    remove_column :sites, :logo_width if ActiveRecord::Base.connection.column_exists?(:sites, :logo_width)
    remove_column :sites, :logo_height if ActiveRecord::Base.connection.column_exists?(:sites, :logo_height)
    remove_column :sites, :logo_uid if ActiveRecord::Base.connection.column_exists?(:sites, :logo_uid)
    remove_column :sites, :logo_ext if ActiveRecord::Base.connection.column_exists?(:sites, :logo_ext)
  end
end