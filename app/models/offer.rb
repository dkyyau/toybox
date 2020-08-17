class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :toy

  validates :start_date, :end_date, :location, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date}
  validates :accepted, inclusion: { in: [true, false] }
end
