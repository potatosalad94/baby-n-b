class Baby < ApplicationRecord
  has_many :reviews
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
