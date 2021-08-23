require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト', type: :system do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let(:genre) { create(:genre) }
  let!(:hobby) { create(:hobby, user: user, genre: genre) }
  # let!(:hobby) { create(:hobby, user: user) }
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
  describe 'マイページ画面のテスト' do
    before do
      visit user_path(user)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it '「マイページ」と表示される' do
        expect(page).to have_content 'マイページ'
      end
      it '会員のニックネームが表示されている' do
        expect(page).to have_content user.nickname
      end
      it '会員の自己紹介文が表示されている' do
        expect(page).to have_content user.introduction
      end
      it 'プロフィール編集が表示されている' do
        expect(page).to have_link, href: edit_user_path(user.id)
      end
      it 'チャット履歴一覧ヘが表示されている' do
        expect(page).to have_link, href: messages_path(user.id)
      end
      it 'フォローが表示されている' do
        expect(page).to have_link, href: user_followings_path(user.id)
      end
      it 'フォロワーが表示されている' do
        expect(page).to have_link, href: user_followers_path(user.id)
      end
      it '投稿一覧に自分の投稿の趣味名が表示される' do
        expect(page).to have_content hobby.name
      end
      it '投稿一覧に自分の投稿のコメントが表示される' do
        expect(page).to have_content hobby.comment
      end
      it '他人の投稿は表示されない' do
        expect(page).not_to have_link '', href: user_path(other_user)
        expect(page).not_to have_content other_hobby.name
        expect(page).not_to have_content other_hobby.comment
      end
    end
  end
  describe '自分のユーザー情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
      it 'ニックネーム編集フォームに自分のニックネームが表示される' do
        expect(page).to have_field 'user[nickname]', with: user.nickname
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '自己紹介編集フォームに自分の自己紹介文が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '変更を保存ボタンが表示される' do
        expect(page).to have_button '変更を保存'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_nickname = user.nickname
        @user_old_intrpduction = user.introduction
        fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 9)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
        click_button '変更を保存'
      end
      it 'nicknameが正しく更新される' do
        expect(user.reload.name).not_to eq @user_old_nickname
      end
      it 'introductionが正しく更新される' do
        expect(user.reload.introduction).not_to eq @user_old_intrpduction
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
  describe '投稿画面のテスト' do
    before do
      visit new_hobby_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/hobbies/new'
      end
      it '「投稿する」と表示される' do
        expect(page).to have_content '投稿する'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'hobby[name]'
      end
      it 'nameフォームに値が入っていない' do
        expect(find_field('hobby[name]').text).to be_blank
      end
      it 'ジャンルフォームが表示される' do
        expect(page).to have_field 'hobby[genre_id]'
      end
      it 'コメントフォームが表示される' do
        expect(page).to have_field 'hobby[comment]'
      end
      it 'コメントフォームに値が入っていない' do
        expect(find_field('hobby[comment]').text).to be_blank
      end
      it '投稿ボタンが表示される' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿成功のテスト' do
      before do
        fill_in 'hobby[name]', with: Faker::Lorem.characters(number: 5)
        choose 'hobby_genre_id_1'
        fill_in 'hobby[comment]', with: Faker::Lorem.characters(number: 20)
      end
      it '自分の新しい投稿が正しく保存される' do
        expect { click_button '投稿' }.to change(user.hobbies, :count).by(1)
      end
      it 'リダイレクト先が,投稿一覧になっている' do
        click_button '投稿'
        expect(current_path).to eq '/hobbies'
      end
    end
  end

  describe '自分の投稿編集画面のテスト' do
    before do
      visit edit_hobby_path(hobby)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/hobbies/' + hobby.id.to_s + '/edit'
      end
      it '「投稿編集」と表示される' do
        expect(page).to have_content '投稿編集'
      end
      it 'ジャンル編集フォームが表示される' do
        expect(page).to have_field 'hobby[genre_id]', with: hobby.genre_id
      end
      it '趣味名編集フォームが表示される' do
        expect(page).to have_field 'hobby[name]', with: hobby.name
      end
      it 'コメント編集フォームが表示される' do
        expect(page).to have_field 'hobby[comment]', with: hobby.comment
      end
      it '投稿ボタンが表示される' do
        expect(page).to have_button '投稿'
      end
    end
    context '編集成功のテスト' do
      before do
        @hobby_old_name = hobby.name
        @hobby_old_genre_id = hobby.genre_id
        @hobby_old_comment = hobby.comment
        fill_in 'hobby[name]', with: Faker::Lorem.characters(number: 5)
        choose 'hobby_genre_id_1'
        fill_in 'hobby[comment]', with: Faker::Lorem.characters(number: 20)
        click_button '投稿'
      end
      it 'nameが正しく更新される' do
        expect(hobby.reload.name).not_to eq @hobby_old_name
      end
      it 'bodyが正しく更新される' do
        expect(hobby.reload.comment).not_to eq @hobby_old_comment
      end
      it 'リダイレクト先が、マイページになっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
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
      it '自分と他人の画像のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(hobby.user)
        expect(page).to have_link '', href: user_path(other_hobby.user)
      end
      it '自分の投稿と他人の投稿のコメントが表示される' do
        expect(page).to have_content hobby.comment
        expect(page).to have_content other_hobby.comment
      end
    end
  end
  describe 'ジャンル一覧検索のテスト' do
    before do
      visit genres_path
    end

    context '表示内容の確認する' do
      it 'URLが正しい' do
        expect(current_path).to eq '/genres/index'
      end
      it '「ジャンル一覧」と表示される' do
        expect(page).to have_content 'ジャンル一覧'
      end
      it '「投稿数ランキング」と表示される' do
        expect(page).to have_content '投稿数ランキング'
      end
    end
  end
end
