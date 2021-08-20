require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はx' do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'nmickameカラム' do
      it '空欄でないこと' do
        user.nickname = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        user.nickname = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.nickname = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.nickname = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はx' do
        user.nickname = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'category' do
      it '空欄ではないこと' do
        user.category = ""
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '180文字以下であること: 180文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 180)
        is_expected.to eq true
      end
      it '180文字以下であること: 181文字はx' do
        user.introduction = Faker::Lorem.characters(number: 181)
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ""
        is_expected.to eq false
      end
      it 'emailに@が含まれていること: @が含まれてれば◯' do
      user.email = "testtest@test.com"
      is_expected.to eq true
      end
      it 'emailに@が含まれていること: @が含まれてればx' do
        user.email = "testtest.com"
        is_expected.to eq false
      end
      it '一意性があること' do
        user.email = other_user.email
        is_expected.to eq false
      end
    end

    context 'passwordカラム' do
      it '空欄でないこと' do
        user.password = ""
        is_expected.to eq false
      end
      it '6文字以上であること: 6文字は◯' do
        user.password = Faker::Lorem.characters(number: 6)
        user.password_confirmation = user.password
        expect(user).to be_valid
      end
      it '6文字以上であること: 5文字はx' do
        user.password = Faker::Lorem.characters(number: 5)
        user.password_confirmation = user.password
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Hobbyモデルとの関係' do
      it '1対Nの関係になっている' do
        expect(User.reflect_on_association(:hobbies).macro).to eq :has_many
      end
    end
  end
end