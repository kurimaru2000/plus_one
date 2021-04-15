
# アプリケーション名:PLUS ONE

# アプリケーション概要
本アプリケーションは自分が読んで学んだ本の内容を「習慣」にすることを目標に制作しました。
本を読んだだけで満足せずそれを習慣化させることで新たな１歩を踏み出せるようアプリ名は『PLUS ONE』としました。
一人では続かないことも誰かと一緒にやれば続けることができるという誰でも持っている感情に着目し同じ目標を持つ人を複数人あつめ励まし合いながら習慣を身につけていくというアプリです。


# ログイン用テストアカウント/パスワード

# 利用方法
本アプリの使用方法はまず自分の読んだ本を本アプリケーションに投稿していただき、そこから本に紐つくルームを作成、そのルーム内に同じ本を読み同じように習慣を手に入れたいと考える人が複数人集まりお互い励まし合いながら習慣化していくという流れです。

# 目指した課題解決
「ためになる本を読み、書いてあることを習慣にしたい」「習慣にはしたいんだけど一人では長続きしない」という人の課題を解決するために作成しました。

# 洗い出した要件
自分の読んだ本を投稿できる・読んだ本から任意のルームを作成できる・ルーム内で発言ができる

# 実装した機能についての画像やGIFおよびその説明
[![Image from Gyazo](https://i.gyazo.com/4779a86f8c4c6cf0b2d6946b6a100b70.jpg)](https://gyazo.com/4779a86f8c4c6cf0b2d6946b6a100b70)
投稿した本は一覧に追加されます

[![Image from Gyazo](https://i.gyazo.com/4b6e084638f50fd278fe7f4844569830.png)](https://gyazo.com/4b6e084638f50fd278fe7f4844569830)
本の詳細画面に飛ぶと本に紐ついたルームが表示されます。

[![Image from Gyazo](https://i.gyazo.com/bad291ef2a839423700372c6d827edae.jpg)](https://gyazo.com/bad291ef2a839423700372c6d827edae)
ルーム内で他の人とチャットでコミュニケーションが可能です。画像の投稿も多可能です。

# 実装予定の機能
本・ルームの検索、一覧機能、ビューファイルの改善、チャットの自動スクロール機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/154b329311f2ad694745b6d0591aa221.png)](https://gyazo.com/154b329311f2ad694745b6d0591aa221)

# ローカルでの動作方法
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code



# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -----------------  | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false  unique: true |
| encrypted_password | string | null: false,              | 

### Association

- has_many :books
- has_many :comments
- has_many :messages
- has_many :room_users
- has_many :users, through: room_users

## books テーブル

| Column             | Type       | Options                       |
| -----------------  | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| author             | string     |                               |
| publishing_company | string     |                               | 
| explanation        | string     | null: false  unique: true     |
| user               | references | null: false, foreign_key:true | 


### Association

- has_many   :rooms
- has_many   :comments
- belongs_to :user


## rooms テーブル

| Column             | Type       | Options                       |
| -----------------  | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| capacity           | string     | null: false                   |
| goal               | string     | null: false                   | 
| book               | references | null: false foreign_key:true  |
 


### Association

- has_many   :room_users
- has_many   :users, through: room_users
- has_many   :messages
- belongs_to :book



## room_users テーブル

| Column             | Type       | Options                       |
| -----------------  | ---------- | ----------------------------- |
| book               | references | null: false, foreign_key:true |
| user               | references | null: false, foreign_key:true |
 


### Association

- belongs_to :user
- belongs_to :room


## commentsテーブル

| Column             | Type       | Options                       |
| -----------------  | ---------- | ----------------------------- |
| comment            | text       | null: false                   |
| book               | references | null: false, foreign_key:true |
| user               | references | null: false, foreign_key:true |
 


### Association

- belongs_to :user
- belongs_to :book

## messagesテーブル

| Column             | Type       | Options                       |
| -----------------  | ---------- | ----------------------------- |
| message            | text       | null: false                   |
| room               | references | null: false, foreign_key:true |
| user               | references | null: false, foreign_key:true |
 


### Association

- belongs_to :user
- belongs_to :room




