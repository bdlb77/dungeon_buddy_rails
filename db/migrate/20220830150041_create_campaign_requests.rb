class CreateCampaignRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_requests do |t|
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
