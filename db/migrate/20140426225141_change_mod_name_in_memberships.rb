class ChangeModNameInMemberships < ActiveRecord::Migration
  def change
  	rename_column :memberships, :mod, :moderator
  end
end
