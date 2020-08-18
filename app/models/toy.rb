class Toy < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :offers

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  validates :category_id, presence: true

  has_one_attached :photo
end
