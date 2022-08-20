class CreateCampaignSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_sessions do |t|
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time
      t.float :latitude
      t.float :longitude
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
