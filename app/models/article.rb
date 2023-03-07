class Article < ApplicationRecord
  geocoded_by :address

  belongs_to :user

  validates :image_url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :image_url, presence: true

  after_validation :geocode, if: :will_save_change_to_street?

  def address
    "#{street}, #{city}"
  end
end
