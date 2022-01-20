class Match < ApplicationRecord
  validates :team_a_player, presence: true
  validates :team_b_player, presence: true

  belongs_to :room
end
