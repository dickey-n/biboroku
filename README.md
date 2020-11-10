# Application


## Name

[BiBoRoku]:(https://biboroku.herokuapp.com/)


## Summary

展覧会のメモ投稿アプリケーション


## Usage

```
$ git clone https://github.com/dickey-n/biboroku.git
$ cd biboroku
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
→ http://localhost:3000/
```


## Problem solving

### **言語化のトレーニング**
- ビジネスマンの、自分の考えをなかなかうまく伝えられない課題を解決したい。
### **趣味の備忘録**
- 1人で美術館に行く主婦の、同じ趣味や好きなアーティストの人たちの考えを知りたいという課題を解決したい。
### **新しい趣味の発見**
- 土日にだらだらと過ごしてしまう社会人の、新しい趣味を見つけたいけど何がいいのかわからないという課題を解決したい。

## Requirement definition

### ユーザー管理機能
- 投稿やコメントをユーザーごとに管理する

### マイページ機能
- ユーザー自身が投稿したメモやブックマークした展覧会を確認できるようにする

### 管理者アカウントの作成
- 展覧会の投稿、編集、削除できるのは管理者のみにするため

### 展覧会の投稿、編集、削除機能（管理者のみ）
- 開催中の展覧会の情報を提供するため

### 展覧会の一覧、詳細の表示機能（全てのユーザー）
- ユーザーが開催中の展覧会を知れるようにするため

### メモ投稿機能
- 足を運んだ展覧会のメモや作品に対しての感想を記録し、他のユーザーにシェアできるようにする

### 展覧会のブックマーク機能
- ユーザーが気になる展覧会にブックマークを付けられるようにする

### メモへの『いいね』機能
- 投稿されたメモに対して他のユーザーがリアクションを取れるようにする

### 展覧会の検索機能
- フリーワードから展覧会を検索できるようにする


## Function

### マイページ
![demo](https://i.gyazo.com/71cc7219e86031e333b8e95f5fe5fa04.gif)

### メモ投稿
![demo](https://i.gyazo.com/24d7d2e17e71777933d79c1b8cb834f3.gif)

### ブックマーク機能
![demo](https://i.gyazo.com/19a43ca6c241036babb347fd1cd3d167.gif)

### 『いいね』機能
![demo](https://i.gyazo.com/3da661976d10813232a7d15705a4c58b.gif)


# Database design

![biboroku](https://user-images.githubusercontent.com/69228855/98641302-e331d280-236e-11eb-894d-2719ee6ba06d.png)


## Table: users 

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| name                  | string  | null: false |
| profile               | text    | null: false |
| admin                 | integer |             |

### Association

- has_many :memos
- has_many :museums
- has_many :like_memos, through: :likes, source: :memo
- has_many :bookmark_museums, through: :bookmarks, source: :museum

## Table: museums

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
- has_many :bookmark_museums, through: :bookmarks, source: :user

## Table: memos

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| memo      | text       |                                |
| user      | references | null: false, foreign_key: true |
| museum    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :museum
- has_many :like_users, through: :likes, source: :user

## Table: likes

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| memo      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo

## Table: bookmarks

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| museum    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :museum