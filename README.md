# アプリ名
QQ（キューツー）

# 概要
クイズ投稿型アプリです。いいね機能搭載。
すでに投稿されているクイズに回答したり、自分で考えたクイズを投稿してシェアすることができます。

# 本番環境
https://quiz-qpp-qq.herokuapp.com/

# 制作背景
## 工夫したポイント
- CSSアニメーションやJavaScriptを用いてゲームっぽい印象を与えるUI
- いいね機能を実装し、各クイズの評価がひと目で確認可能。各ユーザーごとのいいね数も表示。
- 画像投稿も可能。ユーザープロフィールやクイズ投稿をより視覚的にわかりやすく。
## 環境
HTML/CSS/SASS/JavaScript/Ruby/Ruby on Rails
## 課題や今後実装したい機能
- 4択形式などでどんどんクイズが出題されるようなUIや機能を実装して、よりゲーム性を出す
- いいねの数などによるランキング機能を実装し、より評価をわかりやすくする

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile|text|
|profile_image_id|string|

### Association
- has_many :quizzes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_quizzes, through: :likes, source: :quiz

## quizzesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|image_id|string|null: false|
|user_id|integer|null: false|

### Association
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|quiz_id|integer|foreign_key: true|

### Association
- belongs_to :quiz
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|quiz_id|integer|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :quiz
- belongs_to :user
