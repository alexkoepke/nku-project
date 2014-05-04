class ChangeUserIdToIntegerInMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :user_id, :string
    add_column :memberships, :user_id, :integer
  end
end
