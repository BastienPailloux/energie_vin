class Bottle < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :sells, dependent: :destroy
  has_one_attached :photo

  validates :wine_type, presence: true, inclusion: { in: %w[red pink white champagne] }
  validates :name, presence: true, uniqueness: { scope: :year }
  validates :property, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }

  def average_rate
    return "" if ratings.empty?

    ratings.average(:rate).round(2)
  end

  scope :order_by_rate, -> {
    where("bottles.id in (select bottle_id from ratings)")
      .group('bottles.id, bottles.name, bottles.wine_type, bottles.property, bottles.year ')
      .joins(:ratings)
      .order('AVG(ratings.rate) DESC')
    }
end
