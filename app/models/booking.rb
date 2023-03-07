class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article
  enum status: [:pending, :confirmed, :declined, :finished]
end
