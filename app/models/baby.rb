class Baby < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
