class AddModToMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :mod, :boolean, default: true
  end
end
