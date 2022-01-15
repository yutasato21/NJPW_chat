require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成' do
    context 'ルーム作成できる場合' do
      it 'name、text、image、user_idが存在していれば作成できる' do
        expect(@room).to be_valid
      end

      it 'textが空でも作成できる' do
        @room.text = ''
        expect(@room).to be_valid
      end

      it 'imageが空でも作成できる' do
        @room.image = nil
        expect(@room).to be_valid
      end
    end

    context 'ルーム作成できない場合' do
      it 'nameが空では作成できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end

      it 'userが紐づいていないと作成できない' do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("User must exist")
      end
    end
  end
end
