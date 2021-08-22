require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト', type: :system do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let(:genre) { create(:genre) }
  let!(:hobby) { build(:hobby, user_id: user.id, genre_id: genre.id) }
  let!(:other_hobby) { create(:hobby, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト:　ログインしている場合' do
    context 'リンクの内容を確認: ※ログアウトは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

       it 'サイトロゴを押すと、自分のユーザ詳細画面に遷移する' do
         click_on 'ロゴ画像'
         is_expected.to eq '/users/' + user.id.to_s
       end

       it '「マイページ」を押すと、自分のユーザー詳細画面に遷移する' do
         home_link = find_all('a')[1].native.inner_text
         home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
         click_link home_link
         is_expected.to eq '/users/' + user.id.to_s
       end
       it '「投稿フォーム」を押すと、投稿フォーム画面に遷移する' do
         click_link href: new_hobby_path
         is_expected.to eq '/hobbies/new'
      end
      it '「投稿一覧フォーム」を押すと、投稿一覧画面に遷移する' do
         click_link href: hobbies_path
         is_expected.to eq '/hobbies'
      end
      it '「ジャンル一覧検索」を押すと、ジャンル一覧画面に遷移する' do
        click_link href: genres_path
        is_expected.to eq '/genres/index'
      end
    end
  end

  describe '投稿一覧画面のテスト' do
    before do
      visit hobbies_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/hobbies'
      end
    end
  end
end
