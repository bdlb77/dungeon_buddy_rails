class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns
  has_many :campaign_characters
  has_many :participating_campaigns, through: :campaign_characters, source: :campaign

  validates :username, length: { minimum: 2 }, unless: proc { |user| !user.username.present? }
  validates_uniqueness_of :username, unless: proc { |user| !user.username.present? }
end
