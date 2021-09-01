# :star: Win Win Hobby
Win Win Hobbyは趣味を通じて友達を作るサイトです。
<img width="1437" alt="スクリーンショット 2021-08-28 16 53 18" src="https://user-images.githubusercontent.com/83491747/131210881-106f4e8a-44df-4adc-8935-fe87d2e982ae.png">
URL:http://win-win-hobby.com/

## :blue_book:　サイト概要
自分の趣味を教えたい人とその趣味を教わりたい人が繋がる事のできるマッチングサイトです。  また教えたい人同士、教わりたい人同士
でも繋がることができます。

## :two_men_holding_hands: サイトテーマ
趣味を通して人と人の繋がりを作る

## :bulb: テーマを選んだ理由
自分自身過去に全く知識のない状態でギターを買ったことがあるのですが、周りの人にギター経験者がおらず動画などをみて練習するしかなかったのですが、なかなか上達せず上手くなってるかもわからない状態でモチベーションもあがらずすぐに挫折してしまった経験があり、その時に『ひとりで趣味を極めて教えたい人と趣味を始めたくても先生がいない人』のマッチングサービスがあればいいのになと考えたことがあり、さらに、趣味を始めたい人同士や自分と同じ趣味を持つ人同士が簡単に繋がることが出来たら色々な繋がりができて人生をより豊かにすることができるのではないかと考え今回のテーマにしました。

## :dart:　ターゲットユーザ
- 自分の趣味を教えたい人とその趣味を教わりたい人
- 自分と同じレベルの趣味友達が欲しい人
- なんでも良いので何か趣味を始めたい人

## :high_brightness: 主な利用シーン
- 自分の趣味が教えることのできるレベルまで到達して教えたくなった時
- 趣味を始めたいが先生がいない時
- 現在の流行の趣味が知りたいとき

## :computer: 実装機能一覧
| | 機能 | gem/備考 |
| - |------|----------|
| 1 | ユーザー（ログイン機能) | devise |
| 2 | プロフィール編集 | devise |
| 3 | ゲストログイン機能 | x |
| 4 | 画像投稿機能 | refile, refile-mini_magick |
| 5 | 投稿機能(CRUD) | x |
| 6 | フォロー機能 | Ajax(非同期) |
| 7 | DM機能 | Ajax(非同期) |
| 8 | ランキング機能 | x / 同率順位を含めたランキング |
| 9 | PV機能 | impressionist |
| 10 | SNSシェア機能 | social-share-button |
| 11 | お問い合わせ機能 | Action Mailer |
| 12 | ページネーション機能 | kaminari |
| 13 | rails/devise日本語化 | rails-i18n |
| 14 | 検索機能 | x / 部分一致(ユーザー名・趣味名・ジャンル名) |
| 15 | コード解析 | Rubocop |
| 16 | 単体・結合テスト(一部) | RSpec |
| 17 | 自動デプロイ | AWS, Github Actions(CI/CDツール) |
| 18 | ドメイン指定 | お名前.com / AWSRoute 53 |
| 19 | デザイン | bootstrap |
| 20 | デバッグ | pry-byebug, pry-rails |
| 21 | https設定 | AWS(Certificate Manager・Route53) 

チャレンジ要素一覧 https://docs.google.com/spreadsheets/d/1cjLShFfCwpjb9DvkrizhEmcc6WbCV1Ul9xNj-pee6Mc/edit?usp=sharing

## :pencil: 設計書
- ER図 https://app.diagrams.net/#G1CIbPMSS-m9fy7JEJaFBOiaJMLjfSejlJ
- テーブ定義書 https://docs.google.com/spreadsheets/d/1fo-s5qV6ePNgv5Ttwgg7-9Xm6zImNa-LH6vpGUFJfG4/edit?usp=sharing



## :globe_with_meridians: 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## :globe_with_meridians: 使用素材
- https://o-dan.net/ja/
- https://www.logofactoryweb.com/default_lg.asp?lg=ja
- https://undraw.co/search
