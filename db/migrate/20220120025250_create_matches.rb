class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer    :game_number,    null: false
      t.string     :team_a_player,  null: false
      t.string     :team_a_player2
      t.string     :team_a_player3
      t.string     :team_a_player4
      t.string     :team_a_player5
      t.string     :team_b_player,  null: false
      t.string     :team_b_player2
      t.string     :team_b_player3
      t.string     :team_b_player4
      t.string     :team_b_player5
      t.references :room,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
