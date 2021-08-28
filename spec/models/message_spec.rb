require 'rails_helper'

RSpec.describe 'Messageモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { message.valid? }

    let(:message) { create(:message) }

    context 'contentカラム' do
      it '空欄ではないこと' do
        message.content = ""
        is_expected.to eq false
      end
    end

    describe 'アソシエーションのテスト' do
      context 'Userモデルとの関係' do
        it 'N:1となっている' do
          expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end

      context 'Roomモデルとの関係' do
        it 'N:1となっている' do
          expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
        end
      end
    end
  end
end
