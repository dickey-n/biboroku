# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |

### Association

- has_many :memos
- has_many :comments

## museums テーブル

| Column        | Type      | Options                        |
| ----------    | --------- | ------------------------------ |
| title         | string    | null: false                    |
| place         | string    | null: false                    |
| text          | text      | null: false                    |
| prefecture_id | integer   | null: false                    |
| genre_id      | integer   | null: false                    |
| artist        | string    | null: false                    |
| user          | reference | null: false, foreign_key: true |

### Association

- has_many   :memos
- belongs_to :user

## memos テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| museum    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype