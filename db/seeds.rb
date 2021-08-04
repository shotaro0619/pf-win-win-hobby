# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  [{name: '楽器'},{name: '音楽ライブ'},{name: 'カラオケ'},{name: 'アニメ'},{name: '映画'},{name: '映画'},{name: '天体観測'},{name: '歌舞伎'},
  {name: '筋トレ'},{name: 'ヨガ'},{name: 'アロマセラピー'},{name: '温泉めぐり'},{name: '美術館'},{name: '博物館'},{name: '寺巡り'},{name: 'ランニング'},
  {name: 'サッカー'},{name: '野球'},{name: 'ゴルフ'},{name: 'ボルダリング'},{name: 'ダーツ'},{name: 'ダンス'},{name: '自転車'},{name: '登山'},
  {name: 'キャンプ'},{name: '釣り'},{name: 'テレビゲーム'},{name: 'トランプ'},{name: '将棋'},{name: '囲碁'},{name: 'チェス'},{name: 'オセロ'},
  {name: 'ボードゲーム'},{name: 'トレーディングカードゲーム'},{name: '料理'},{name: 'イラスト'},{name: 'プラモデル'},{name: 'ハンドメイド'},
  {name: '園芸'},{name: '観葉植物'},{name: 'アクアリウム'},{name: 'ペット'},{name: '外国語'},{name: 'プログラミング'},{name: 'カメラ'},
  {name: 'マジック'},{name: '車'},{name: 'バイク'},{name: 'サバゲー'},{name: '競馬'},{name: 'パチンコ'},{name: 'アイドル'},{name: 'ドローン'},
  {name: 'その他'}])