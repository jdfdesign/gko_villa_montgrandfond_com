class AddShallowPermalinkToSection < ActiveRecord::Migration
  def change
    add_column :sections, :shallow_permalink, :boolean, :default => true
  end
end