class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string     :fav_team
      t.string     :fav_player
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
