class Article < ApplicationRecord
  geocoded_by :address
  has_one_attached :photo
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :photo, presence: true
  after_validation :geocode, if: :will_save_change_to_street?

  def address
    "#{street}, #{city}"
  end
end
