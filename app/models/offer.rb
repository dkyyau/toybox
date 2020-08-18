class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :toy
  has_many :messages

  validates :start_date, :end_date, :location, presence: true
  # start_date after current date
  # end_date after start_date
  validates :accepted, inclusion: { in: [true, false] }
end
