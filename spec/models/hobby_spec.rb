require 'rails_helper'

RSpec.describe 'Hobbyモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { hobby.valid? }

    let(:user) { create(:user) }
    let(:genre) { create(:genre) }
    let!(:hobby) { build(:hobby, user_id: user.id, genre_id: genre.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        hobby.name = ""
        is_expected.to eq false
      end
    end

    context 'commentカラム' do
      it '空欄ではないこと' do
        hobby.comment = ""
        is_expected.to eq false
      end
      it '180文字以下であること: 180文字は◯' do
        hobby.comment = Faker::Lorem.characters(number: 180)
        expect(hobby.valid?).to eq true
      end
      it '180文字以下であること: 181文字はx' do
        hobby.comment = Faker::Lorem.characters(number: 181)
        expect(hobby.valid?).to eq false
      end
    end

    context 'genre_idカラム' do
      it '空欄ではないこと' do
        hobby.genre_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Hobby.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(Hobby.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end
