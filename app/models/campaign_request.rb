class CampaignRequest < ApplicationRecord
  enum :status, { rejected: 0, accepted: 1, pending: 2 }

  belongs_to :user
  belongs_to :campaign

  validates_uniqueness_of :user,
                          scope: [:campaign],
                          message: "User request already to join this Campaign"
end
