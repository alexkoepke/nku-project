class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.string :game
      t.references :user
      t.timestamps
    end
  end
end
