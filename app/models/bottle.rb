class Bottle < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :sells, dependent: :destroy
  has_one_attached :photo

  validates :wine_type, presence: true, inclusion: { in: %w[red pink white champagne] }
  validates :name, presence: true, uniqueness: { scope: :year }
  validates :property, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }

  def average_rate
    return 0 if ratings.empty?

    ratings.average(:rate).round(2)
  end

  def price
    return "" if sells.empty?

    sells.last.price
  end

  scope :order_by_rate, -> {
      select("bottles.id, bottles.name, bottles.wine_type, bottles.property, bottles.year")
        .group("bottles.id")
        .joins(:ratings)
        .select('AVG(ratings.rate) AS average_rating')
        .order('average_rating DESC')
    }
end
