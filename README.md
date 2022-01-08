# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many room_users
- has_many comments
- has_many favorites
- has_many supports
- has_many follows

## rooms テーブル

| Column | Type   | Option      |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   |             |

### Association

- has_many room_users
- has_many comments
- has_many matches

## room_users テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Association

- belongs_to user
- belongs_to room

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

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| team_a_player | string     |                                |
| team_b_player | string     |                                |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to room
- has_one support

## favorites テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| player_id | integer    |                                |
| team_id   | integer    |                                |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to user

## supports テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| vote     |            |                                |
| user_id  | references | null: false, foreign_key: true |
| match_id | references | null: false, foreign_key: true |

### Association

- belongs_to user
- belongs_to match

## follows テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to user