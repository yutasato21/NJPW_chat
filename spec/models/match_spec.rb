require 'rails_helper'

RSpec.describe Match, type: :model do
  before do
    @match = FactoryBot.build(:match)
  end

  describe '対戦カード作成' do
    context '対戦カードを作成できる場合' do
      it 'game_number、team_a_player、team_a_player2
      team_a_player3、team_a_player4、team_a_player5、team_b_player、team_b_player2、team_b_player3、team_b_player4、team_b_player5が存在すれば作成できる' do
        expect(@match).to be_valid
      end

      it 'team_a_player2が空でも作成できる' do
        @match.team_a_player2 = ''
        expect(@match).to be_valid
      end

      it 'team_a_player3が空でも作成できる' do
        @match.team_a_player3 = ''
        expect(@match).to be_valid
      end

      it 'team_a_player4が空でも作成できる' do
        @match.team_a_player4 = ''
        expect(@match).to be_valid
      end

      it 'team_a_player5が空でも作成できる' do
        @match.team_a_player5 = ''
        expect(@match).to be_valid
      end

      it 'team_b_player2が空でも作成できる' do
        @match.team_a_player2 = ''
        expect(@match).to be_valid
      end

      it 'team_b_player3が空でも作成できる' do
        @match.team_a_player3 = ''
        expect(@match).to be_valid
      end

      it 'team_b_player4が空でも作成できる' do
        @match.team_a_player4 = ''
        expect(@match).to be_valid
      end

      it 'team_b_player5が空でも作成できる' do
        @match.team_a_player5 = ''
        expect(@match).to be_valid
      end
    end

    context '対戦カードを作成できない場合' do
      it 'game_numberが空では作成できない' do
        @match.game_number = ''
        @match.valid?
        expect(@match.errors.full_messages).to include("Game number can't be blank")
      end

      it 'team_a_playerが空では作成できない' do
        @match.team_a_player = ''
        @match.valid?
        expect(@match.errors.full_messages).to include("Team a player can't be blank")
      end

      it 'team_b_playerが空では作成できない' do
        @match.team_b_player = ''
        @match.valid?
        expect(@match.errors.full_messages).to include("Team b player can't be blank")
      end
    end
  end
end
