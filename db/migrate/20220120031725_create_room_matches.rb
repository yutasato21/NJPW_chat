class CreateRoomMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :room_matches do |t|
      t.references :room,  null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.timestamps
    end
  end
end
