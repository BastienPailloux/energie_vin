class Sell < ApplicationRecord
  belongs_to :website
  belongs_to :bottle

  validates :price, presence: true
  validates :bottle_id, presence: true
end
