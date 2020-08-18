class Message < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :content, presence: true
  validates :offer_id, presence: true
  validates :user_id, presence: true
end
