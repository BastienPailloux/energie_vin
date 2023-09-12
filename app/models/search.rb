class Search < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :min_price, presence: true, uniqueness: { scope: [:max_price, :user_id] }
  validates :max_price, presence: true
end
