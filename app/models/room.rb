class Room < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :matchs, through: :room_matchs
  has_many :room_matchs
end
