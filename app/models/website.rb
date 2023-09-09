class Website < ApplicationRecord
  has_many :sells, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
