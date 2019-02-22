class Review < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5]
  belongs_to :baby
  belongs_to :user
  validates :content, presence: true
  validates :title, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS }

  # def nice_date
  #   date.strftime("%b %d, %Y") if date
  # end
end
