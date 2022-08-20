class CampaignSession < ApplicationRecord
  belongs_to :campaign

  validates :location, :date, :start_time, :end_time, presence: true
  validate :session_times_not_in_past, :end_time_not_before_start_time

  private

  def session_times_not_in_past
    errors.add(:date, "Can't Be in Past") if date < Date.today
  end

  def end_time_not_before_start_time
    err_message = "Session Cannot End before it Began"
    errors.add(:end_time, err_message) if end_time < start_time
  end
end
