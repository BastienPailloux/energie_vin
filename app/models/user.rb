class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings, dependent: :destroy
  has_many :searches, dependent: :destroy
  has_one_attached :photo

  validates :profile, presence: true, inclusion: { in: %w(user expert) }
  validates :name, presence: true
end
