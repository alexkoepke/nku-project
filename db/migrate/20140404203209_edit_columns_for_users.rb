class EditColumnsForUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :steam, :string
  	remove_column :users, :playstation, :string
  	remove_column :users, :xbox, :string
  	add_column :users, :handle, :string
  	add_column :users, :network, :string
  end
end
