class Baby < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :reviews
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :address, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_address?
end
