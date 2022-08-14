class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.boolean :active
      t.integer :maximum_player_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
