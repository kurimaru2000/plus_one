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




