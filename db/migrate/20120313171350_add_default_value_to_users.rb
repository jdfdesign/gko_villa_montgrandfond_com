class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :sign_in_count, 0)
  end
end