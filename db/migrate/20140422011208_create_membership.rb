class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :status
      t.timestamps
    end
  end
end
