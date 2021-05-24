# Renraku!
保育園や幼稚園の連絡帳をスマホで簡単に送信できるアプリケーションです。<br>保育園からのお知らせもRenraku!を確認するだけです。<br>

### URL
IPアドレス :54.227.146.87

![top 2021-05-23 12 55 38](https://user-images.githubusercontent.com/73922688/119247639-517d0a80-bbc6-11eb-966d-77b24254e073.png)

## なぜ作成したか
現在保育所は全国に約4万件に登るとのデータがあります。[参考資料](http://www.garbagenews.net/archives/2092001.html) <br>しかし、連絡帳のアプリ化はまだまだ浸透しておらず、私も毎日連絡帳を2冊書いている現状です。<br>スマホでさっと連絡したいと考えている保護者の方は多いのではと考えて、<br>このアプリを開発することにしました。<br><br>

### :couple: ペルソナ
30代、2人の子供(1才、3才)を持つフルタイムで働く夫婦。<br>保育園の送り迎えはお父さんが行っているので、連絡帳の記入に朝時間を取られるのが悩み。<br><br>

## 機能一覧
保護者の方は新規登録により、連絡帳としてこのアプリをご利用いただけます。<br>先生方は管理者としてログインいただくことで、お知らせを投稿していただけます。<br>

### 出欠フォーム送信機能（保護者）
アクティブハッシュ により簡単に出欠フォームを送信できます。
![8a7ead78dfb7f7629f8ad06aee9f2b77](https://user-images.githubusercontent.com/73922688/119276931-c3e9fb00-bc57-11eb-8418-ff53460955ea.gif)
### お知らせ一覧確認機能
保育者の送信したお知らせを確認することができます。
![fb844960f63314c40abe24919a3934d8](https://user-images.githubusercontent.com/73922688/119277045-5ab6b780-bc58-11eb-9101-e048679f8b64.gif)

### その他の機能
- レスポンシブデザイン対応
- 個別メッセージ機能


## 要件定義
- ユーザー管理機能
  - ユーザーを新しく登録できます。
  - ユーザー登録が完了している場合、ログインすることができます。
  - ユーザー登録後にユーザー情報を編集することができます。
  - ユーザー登録後、ユーザーは登録情報を削除することができます。
  - ログアウトできます。
- 出欠フォーム投稿機能
  - 出席や体温を選択式の項目から選択していただき、<br>送信ボタンを押すことで連絡は完了です。
- プリント（お知らせ）投稿機能
  - 先生はお知らせとして、タイトルを本文（必要であれば画像も１枚まで添付可能）<br>を投稿することができます。
  - 保護者の方はお知らせを一覧で確認することができます。
- チャット機能
  - 連絡を行う場であるチャットルームが作成できます。
  - ユーザーがチャットルームの名前を決定できます。
  - チャットを行うことができます。
- 写真付きメッセージ投稿機能
  - テキストと画像が投稿できます。
  - 投稿した画像とテキストは投稿したチャットルームにのみ表示できます。<br><br>

## 環境・使用技術

### フロントエンド
- HTML
- SCSS

### バックエンド
- Ruby  2.6.5
- Ruby on Rails 6.0.0

### 開発環境
- MySQL

### 本番環境
- AWS(EC2, S3)
- Nginx
- MariaDB

# テーブル設計

## users テーブル

| Column             | Type    |  Options                  |
|--------------------|---------|---------------------------|
| child_name         | string  | null:false                |
| name               | string  | null:false, unique: true  |
| email              | string  | null:false, unique: true  |
| encrypted_password | string  | null:false, unique: true  |

### Association

- has_many :attendances
- has_many :messages
- has_many :prints

## attendances テーブル

| Colum           | Type        | Options                      |
|-----------------|-------------|------------------------------|
| presence_id     | integer     | null:false                   |
| breakfast_id    | integer     | null:false                   |
| bath_id         | integer     | null:false                   |
| temperature_id  | integer     | null:false                   |
| user            | references  | null:false,foreign_key: true |

### Association

- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null:false                     |
| text    | string     | null:false                     |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## prints テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null:false                     |
| text    | string     | null:false                     |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user




