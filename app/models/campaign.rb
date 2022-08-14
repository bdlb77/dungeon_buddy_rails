class Campaign < ApplicationRecord
  has_many :campaign_sessions
  has_many :campaign_characters
  # todo: has_many participants through campaign_characters
  belongs_to :user
end
