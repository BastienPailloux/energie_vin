class Rating < ApplicationRecord
  belongs_to :bottle
  belongs_to :user

  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :bottle_id, presence: true
  validates :user_id, presence: true

end
