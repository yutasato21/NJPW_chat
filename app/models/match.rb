class Match < ApplicationRecord
  validates :team_a_player, presence: true
  validates :team_b_player, presence: true

  has_many :rooms, through: :room_matchs
  has_many :room_matchs
end
