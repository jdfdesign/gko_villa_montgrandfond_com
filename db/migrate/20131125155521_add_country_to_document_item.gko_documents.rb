# This migration comes from gko_documents (originally 20131003184200)
class AddCountryToDocumentItem < ActiveRecord::Migration
  def change
    remove_column :document_items, :country_id
    add_column :document_items, :country, :string
  end
end