class AddMoreDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :steam, :string
  	add_column :users, :playstation, :string
  	add_column :users, :xbox, :string
  end
end
