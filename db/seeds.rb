# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  [{label: "音楽系", name: '楽器', id:1},{label: "音楽系", name: '音楽ライブ', id:2},{label: "音楽系", name: 'カラオケ', id:3},
  {label: "鑑賞系", name: 'アニメ', id:4},{label: "鑑賞系", name: '映画', id:5},{label: "鑑賞系", name: '映画', id:6},
  {label: "鑑賞系", name: '天体観測', id:7},{label: "鑑賞系", name: '歌舞伎', id:8},
  {label: "美容・健康", name: '筋トレ', id:9},{label: "美容・健康", name: 'ヨガ', id:10},{label: "美容・健康", name: 'アロマセラピー', id:11},
  {label: "旅行・お出かけ", name: '温泉めぐり', id:12},{label: "旅行・お出かけ", name: '美術館', id:13},{label: "旅行・お出かけ", name: '博物館', id:14},
  {label: "旅行・お出かけ", name: '寺巡り', id:15},
  {label: "スポーツ系", name: 'ランニング', id:16},{label: "スポーツ系", name: 'サッカー', id:17},{label: "スポーツ系", name: '野球', id:19},
  {label: "スポーツ系", name: 'ゴルフ', id:20},{label: "スポーツ系", name: 'ボルダリング', id:21},{label: "スポーツ系", name: 'ダーツ', id:22},
  {label: "スポーツ系", name: 'ダンス', id:23},{label: "スポーツ系", name: '自転車', id:24},
  {label: "自然・アウトドア系", name: '登山', id:25},{label: "自然・アウトドア系", name: 'キャンプ', id:26},{label: "自然・アウトドア系", name: '釣り', id:27},
  {label: "ゲームボードゲーム", name: 'テレビゲーム', id:28},
  {label: "ゲームボードゲーム", name: 'トランプ', id:29},{label: "ゲームボードゲーム", name: '将棋', id:30},
  {label: "ゲームボードゲーム", name: '囲碁', id:31},{label: "ゲームボードゲーム", name: 'チェス', id:32},{label: "ゲームボードゲーム", name: 'オセロ', id:33},
  {label: "ゲームボードゲーム", name: 'ボードゲーム', id:34},{label: "ゲームボードゲーム", name: 'トレーディングカードゲーム', id:35},
  {label: "作る系", name: '料理', id:36},{label: "作る系", name: 'イラスト', id:37},{label: "作る系", name: 'プラモデル', id:38},
  {label: "作る系", name: 'ハンドメイド', id:39},
  {label: "ペット・育てる系", name: '園芸', id:40},{label: "ペット・育てる系", name: '観葉植物', id:41},{label: "ペット・育てる系", name: 'アクアリウム', id:42},
  {label: "ペット・育てる系", name: 'ペット', id:43},
  {label: "スキル系", name: '外国語', id:44},{label: "スキル系", name: 'プログラミング', id:45},{label: "スキル系", name: 'カメラ', id:46},
  {label: "スキル系", name: 'マジック', id:47},
  {label: "乗り物系", name: '車', id:48},{label: "乗り物系", name: 'バイク', id:49},
  {label: "その他", name: 'サバゲー', id:50},{label: "その他", name: '競馬', id:51},{label: "その他", name: 'パチンコ', id:52},
  {label: "その他", name: 'アイドル', id:53},{label: "その他", name: 'ドローン', id:54},{label: "その他", name: 'その他', id:55}])