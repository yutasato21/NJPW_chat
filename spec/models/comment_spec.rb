require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it 'content、user_id、room_idが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できない場合' do
      it 'contentが空では投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end

      it 'userが紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end

      it 'roomが紐付いていないと投稿できない' do
        @comment.room = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
