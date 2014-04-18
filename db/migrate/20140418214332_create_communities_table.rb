class CreateCommunitiesTable < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
