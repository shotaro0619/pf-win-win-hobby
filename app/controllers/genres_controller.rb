class GenresController < ApplicationController
  before_action :authenticate_user!
  def index
    @genres_1 = Genre.where(label: "音楽系")
    @genres_2 = Genre.where(label: "鑑賞系")
    @genres_3 = Genre.where(label: "美容・健康")
    @genres_4 = Genre.where(label: "旅行・お出かけ")
    @genres_5 = Genre.where(label: "スポーツ系")
    @genres_6 = Genre.where(label: "自然・アウトドア系")
    @genres_7 = Genre.where(label: "ゲームボードゲーム")
    @genres_8 = Genre.where(label: "作る系")
    @genres_9 = Genre.where(label: "ペット・育てる系")
    @genres_10 = Genre.where(label: "スキル系")
    @genres_11 = Genre.where(label: "乗り物系")
    @genres_12 = Genre.where(label: "その他")
    # @genre_labels = Genre.group(:label).select("label")
    @all_ranks = Genre.find(Hobby.group(:genre_id).order('count(genre_id) desc').limit(10).pluck(:genre_id))
  end
end
