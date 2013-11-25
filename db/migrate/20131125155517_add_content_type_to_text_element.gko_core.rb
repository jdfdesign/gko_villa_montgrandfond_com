# This migration comes from gko_core (originally 20131031072100)
class AddContentTypeToTextElement < ActiveRecord::Migration
  def change
    add_column :text_elements, :value_type, :string
    rename_column :text_elements, :content, :value
    rename_column :text_elements, :name, :key
    rename_column :text_element_translations, :content, :value
  end
end