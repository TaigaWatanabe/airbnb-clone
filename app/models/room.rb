class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
