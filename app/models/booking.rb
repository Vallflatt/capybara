class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article
  enum status: [:pending, :confirmed, :declined, :finished]
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_in_future

  private

  def dates_in_future
    return unless start_date && end_date

    errors.add(:end_date, "end date must be after start date") if start_date > end_date

    errors.add(:start_date, "start date can't be in the past") if start_date < Date.today
  end
end
