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