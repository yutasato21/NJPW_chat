require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成' do
    context 'ルーム作成できる場合' do
      it 'name、text、user_idが存在していれば作成できる'
    end
  end
end
