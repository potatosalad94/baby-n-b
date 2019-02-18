class Booking < ApplicationRecord
  belongs_to :baby
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true

end
