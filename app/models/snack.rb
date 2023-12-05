class Snack < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :price, presence: true
end
