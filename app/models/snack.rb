class Snack < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :global_search,
  against: [ :name, :description ],
  associated_against: {
    user: [:username]
  },
  using: {
    tsearch: { prefix: true }
  }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :price, presence: true
end
