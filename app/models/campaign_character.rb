class CampaignCharacter < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validate :full_campaign?

  private

  def full_campaign?
    if campaign.campaign_characters.count >= campaign.maximum_player_count
      errors.add(:campaign_count, "This Campaign is Full.")
    end
  end
end
