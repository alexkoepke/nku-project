class AddUserIdToMebership < ActiveRecord::Migration
  def change
  	add_column :memberships, :user_id, :string
  end
end
