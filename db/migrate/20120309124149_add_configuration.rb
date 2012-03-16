class AddConfiguration < ActiveRecord::Migration
  def change
    create_table :configurations, :force => true do |t|
      t.references :site
      t.string :name
      t.string :type, :limit => 50
      t.timestamps
    end
  end
end