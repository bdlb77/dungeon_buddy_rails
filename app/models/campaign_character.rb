class CampaignCharacter < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates_uniqueness_of :user,
                          scope: [:campaign],
                          message: "This User is already in the Campaign."
  validate :full_campaign?

  private

  def full_campaign?
    errors.add(:campaign_count, "This Campaign is Full.") if
      campaign.campaign_characters.count >= campaign.maximum_player_count
  end
end
