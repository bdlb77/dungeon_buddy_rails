class CreateCampaignCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_characters do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :class

      t.timestamps
    end
  end
end
