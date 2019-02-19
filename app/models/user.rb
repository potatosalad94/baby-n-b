class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :babies, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
