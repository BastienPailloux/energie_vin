class Bottle < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :sells, dependent: :destroy

  validates :type, presence: true, inclusion: { in: %w(red pink white champagne) }
  validates :name, presence: true
  validates :property, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
end
