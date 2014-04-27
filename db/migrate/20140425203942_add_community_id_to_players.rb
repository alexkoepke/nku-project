class AddCommunityIdToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :community_id, :string
  end
end
