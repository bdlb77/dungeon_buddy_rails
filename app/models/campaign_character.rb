class CampaignCharacter < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
end
