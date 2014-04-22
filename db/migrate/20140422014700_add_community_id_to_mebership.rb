class AddCommunityIdToMebership < ActiveRecord::Migration
  def change
  	add_column :memberships, :community_id, :string
  end
end
