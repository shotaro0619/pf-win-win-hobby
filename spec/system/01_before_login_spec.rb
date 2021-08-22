require 'rails_helper'

describe '[STEP1]ユーザーログイン前のテスト', type: :system do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'はじめるリンクが表示される' do
        expect(page).to have_link 'はじめる'
      end
      it 'アカウントをお持ちの方はこちら（ログイン）リンクが表示される: 「こちら」のみリンクである' do
        expect(page).to have_link 'こちら'
      end
      it 'お問い合わせリンクが表示される' do
        expect(page).to have_link 'こちら'
      end
    end
  end

  describe 'Win Win Hobbyとは？画面のテスト' do
    before do
      visit '/homes/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/homes/about'
      end
    end
  end

  describe 'お問い合わせのテスト' do
    before do
      visit '/contacts/new'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/contacts/new'
      end
      it '「お問い合わせ」と表示される' do
        expect(page).to have_content 'お問い合わせ'
      end
      it 'お名前フォームが表示される' do
        expect(page).to have_field 'contact[name]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'contact[email]'
      end
      it '電話番号フォームが表示される' do
        expect(page).to have_field 'contact[phone_number]'
      end
      it 'メッセージフォームが表示される' do
        expect(page).to have_field 'contact[message]'
      end
      it '入力内容確認ボタンが表示される' do
        expect(page).to have_button '入力内容確認'
      end
    end
    context 'お問合せ内容確認画面のテスト' do
      before do
        fill_in 'contact[name]', with: 'テストユーザー'
        fill_in 'contact[email]', with: 'test@example.com'
        fill_in 'contact[phone_number]', with: '09012345678'
        fill_in 'contact[message]', with: 'あああああああああああああああ'
        click_button '入力内容確認'
      end

      it 'URLが正しい' do
        expect(current_path).to eq '/contacts/confirm'
      end
      it 'お名前が表示される' do
        expect(page).to have_content 'テストユーザー'
      end
      it 'メールアドレスが表示される' do
        expect(page).to have_content 'test@example.com'
      end
      it '電話番号が表示される' do
        expect(page).to have_content '09012345678'
      end
      it 'お問い合わせ内容が表示される' do
        expect(page).to have_content 'あああああああああああああああ'
      end
    end
    context 'お問い合わせ送信のテスト' do
      before do
        
        fill_in 'contact[name]', with: 'テストユーザー'
        fill_in 'contact[email]', with: 'test@example.com'
        fill_in 'contact[phone_number]', with: '09012345678'
        fill_in 'contact[message]', with: 'あああああああああああああああ'
        click_button '入力内容確認'
        click_button '送信'
      end

      it 'URLが正しい' do
        expect(current_path).to eq '/thanks'
      end
      it '「お問い合わせいただきありがとうございました。」と表示される' do
        expect(page).to have_content 'お問い合わせいただきありがとうございました。'
      end
    end
  end
  describe 'ユーザー新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'お名前フォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'ニックネームフォームが表示される' do
        expect(page).to have_field 'user[nickname]'
      end
      it 'カテゴリーフォームが表示される' do
        expect(page).to have_field 'user[category]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'パスワード確認用フォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
      it 'ゲストログインボタンが表示される' do
        expect(page).to have_link 'ゲストログイン（閲覧用）'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 10)
        choose 'user_category_先生'
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、投稿全一覧になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/hobbies'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示されている' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'ゲストログインボタンが表示される' do
        expect(page).to have_link 'ゲストログイン（閲覧用）'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end
      it 'ログイン後のリダイレクト先が、投稿全一覧になっている' do
        expect(current_path).to eq '/hobbies'
      end
    end
    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
     end
    end
  end

  describe 'ヘッダーのテスト:　ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'ようこそが表示される' do
        expect(page).to have_content 'ようこそ'
      end
      it 'マイページリンクが表示される' do
        expect(page).to have_link 'マイページ'
      end
      it '投稿フォームが表示される' do
        expect(page).to have_link '投稿フォーム'
      end
      it '投稿一覧' do
        expect(page).to have_link '投稿一覧'
      end
      it 'ジャンル一覧検索' do
        expect(page).to have_link 'ログアウト'
      end
    end
  end

  describe 'ユーザーロスアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      click_link href: destroy_user_session_path
    end

    context 'ログアウトの機能テスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてWin Win Hobbyとは?画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/homes/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end