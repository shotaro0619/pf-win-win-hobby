require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { contact.valid?}

    let(:contact) { create(:contact)}

    context 'nameカラム' do
      it '空欄ではないこと' do
        contact.name = ""
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字はx' do
        contact.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は○' do
        contact.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はx' do
        contact.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it '20文字以下であること: 20文字は○' do
        contact.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
    end

    context 'messageカラム' do
      it '空欄ではないこと' do
        contact.message = ""
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は◯' do
        contact.message = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '2文字以上であること: 1文字はx' do
        contact.message = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は◯' do
        contact.message = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字はx' do
        contact.message = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄ではないこと' do
        contact.email = ""
        is_expected.to eq false
      end
      it 'emailに@が含まれていること: @が含まれてれば◯' do
        contact.email = "testtest@test.com"
        is_expected.to eq true
      end
      it 'emailに@が含まれていること: @が含まれてればx' do
        contact.email = "testtest.com"
        is_expected.to eq false
      end
    end
    context 'phone_numberカラム' do
      it '空欄ではないこと' do
        contact.phone_number = ""
        is_expected.to eq false
      end
      it '数字以外が使われているとお問合せできない' do
        contact.phone_number = "aaaaaaaaaa"
        is_expected.to eq false
      end
      it '10文字であること' do
        contact.phone_number = "0566111111"
        is_expected.to eq true
      end
      it '9文字以下はお問い合わせできない' do
        contact.phone_number = "056611111"
        is_expected.to eq false
      end
      it '11文字であること' do
        contact.phone_number = "09011111111"
        is_expected.to eq true
      end
      it '12文字以上はお問い合わせできない' do
        contact.phone_number = "090111111111"
        is_expected.to eq false
      end
    end
  end
end