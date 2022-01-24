| 記述すること                                  | 備考                                                                                       |
| --------------------------------------------- | ------------------------------------------------------------------------------------------ |
| アプリケーション名	                          | 新日chat                                                                                   |
| アプリケーション概要                          | 新日本プロレスワールドで生中継を視聴しているユーザーが感情共有するためのチャットアプリです |
| URL                                           | https://njpw-chat.herokuapp.com/                                                           |
| テスト用アカウント                            | メールアドレス: sample@email  パスワード: sample123                                        |
| 利用方法                                      | 1. トップページの一覧ページのヘッダーからユーザー新規登録を行います  2. 同じく一覧ページのヘッダーからルーム作成を行います  3. 一覧ページから作成したルーム名、もしくは画像をクリックし、ルームの詳細ページへ遷移します  4. ルーム詳細ページの左側にあるカード作成ボタンをクリックし、対象となる試合の試合順、選手名を入力して作成します  5. ルーム詳細ページの右下にあるフォームにコメント内容を入力して横の送信ボタンをクリックするとコメントする事ができます  6. コメント投稿者の名前をクリックするとユーザーの詳細ページに遷移します |
| アプリケーションを作成した背景                | 私はプロレスが好きでよく新日本プロレスワールドという配信サイトを利用して観戦しているのですが、ここ数年流行り病の影響で観客席からの歓声が感染対策により、禁止となってしまいました。そのため配信で観戦している私としては、静まり返った試合を観戦することに、どこか物足りなさを感じるようになりました。物足りなさを感じるのは、歓声が禁止になったことで感情共有できる人が居ないからなのではと仮説を立てました。そこで、配信で観戦している人たちで感情共有をすることで解決するのではと思い、プロレス観戦用のチャットアプリを開発することにしました。
| 洗い出した要件                                | https://docs.google.com/spreadsheets/d/1rkQisAgudtUmt9eoInY8mW4DYPNyHbXhJHQ1pCFfneg/edit#gid=982722306
| 実装した機能についての画像やGIFおよびその説明 | 
| 実装予定の機能                                | お気に入り機能 |
| データベース設計                              | [![Image from Gyazo](https://i.gyazo.com/eaf9299eb22bf090cbe1f543b88aeb86.png)](https://gyazo.com/eaf9299eb22bf090cbe1f543b88aeb86) |
| 画面遷移図                                    |
| 開発環境                                      | * フロントエンド：HTML,CSS / JavaScript  * バックエンド：Ruby / Ruby on Rails  * テスト：RSpec  テキストエディタ：Visual Studio Code  * タスク管理：GitHubプロジェクトボード |
| ローカルでの動作方法                          | git clone https://github.com/yutasato21/NJPW_chat  % cd NJPW_chat  % bundle install  % yarn install |

# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many room
- has_many comments
- has_many favorites

## rooms テーブル

| Column | Type   | Option      |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   |             |

### Association

- has_many comments
- has_many matches
- belongs_to user

## comments テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Association

- belongs_to user
- belongs_to room

## matches テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| game_number    | integer    | null: false                    |
| team_a_player  | string     | null: false                    |
| team_a_player2 | string     |                                |
| team_a_player3 | string     |                                |
| team_a_player4 | string     |                                |
| team_a_player5 | string     |                                |
| team_b_player  | string     | null: false                    |
| team_b_player2 | string     |                                |
| team_b_player3 | string     |                                |
| team_b_player4 | string     |                                |
| team_b_player5 | string     |                                |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to room

## favorites テーブル ※必須項目では無いため後日追加実装予定

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| fav_player | string     |                                |
| fav_team   | string     |                                |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to user