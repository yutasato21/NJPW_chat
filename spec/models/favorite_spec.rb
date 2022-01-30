require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'お気に入り登録' do
    context 'お気に入りを登録できる場合' do
      it 'fav_team、fav_player、user_idがあれば登録できる' do
        expect(@favorite).to be_valid
      end

      it 'fav_teamが空でも登録できる' do
        @favorite.fav_team = ''
        expect(@favorite).to be_valid
      end

      it 'fav_playerが空でも登録できる' do
        @favorite.fav_player = ''
        expect(@favorite).to be_valid
      end
    end

    context 'お気に入りを登録できない場合' do
      it 'userが紐づいていないと登録できない' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("User must exist")
      end
    end
  end
end
