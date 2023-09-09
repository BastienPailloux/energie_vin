class Website < ApplicationRecord
  has_many :sells, dependent: :destroy
end
