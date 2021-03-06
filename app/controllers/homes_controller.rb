class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about, :guest_sign_in]
  def top
  end

  def about
  end

  # ゲストログイン
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |guest|
      guest.password = SecureRandom.urlsafe_base64
      guest.name = "ゲスト"
      guest.nickname = "ゲスト"
      guest.category = "先生"
    end
    sign_in user
    redirect_to hobbies_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
