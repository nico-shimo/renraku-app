# レン'ラク'!
手書きで毎朝記入する連絡帳をなくそう。スマホで簡単に出欠投稿でき、<br>保育園からのお知らせもレン'ラク'!を確認するだけです。<br>

### URL

## 利用方法
保護者の方は新規登録により、連絡帳としてこのアプリをご利用いただけます。<br>先生方は管理者としてログインいただくことで、お知らせを投稿していただけます。<br>

## 課題解決
現在保育所は全国に約4万件に登るとのデータがあります。[参考資料](http://www.garbagenews.net/archives/2092001.html) <br>しかし、連絡帳のアプリ化はまだまだ浸透しておらず、私も毎日連絡帳を2冊書いている現状です。<br>スマホでさっと連絡したいと考えている保護者の方は多いのではと考えて、<br>このアプリを開発することにいたしました。<br><br>

### :smiley:ペルソナ
30代、2人の子供(1才、3才)を持つフルタイムで働く夫婦。<br>保育園の送り迎えはお父さんが行っているので、連絡帳の記入に朝時間を取られるのが悩み。<br><br>

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




