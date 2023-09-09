class Bottle < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :sells, dependent: :destroy
  has_one_attached :photo

  validates :type, presence: true, inclusion: { in: %w(red pink white champagne) }
  validates :name, presence: true, uniqueness: { scope: :year }
  validates :property, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
end
