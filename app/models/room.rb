class Room < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments
end
