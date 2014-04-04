class RenameJoinsToPlayers < ActiveRecord::Migration
  def change
  	rename_table :joins, :players
  end
end
