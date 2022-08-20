class Campaign < ApplicationRecord
  has_many :campaign_sessions
  has_many :campaign_characters
  has_many :participants, through: :campaign_characters, source: :user
  belongs_to :user

  validates :title, :description, presence: true
  validates :maximum_player_count, numericality: { only_integer: true }
  validates :active, inclusion: [true, false]
end
