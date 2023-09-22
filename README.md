# アプリケーション名
moyamoya

# アプリケーション概要
悩みや不安をアプリケーション相手にアウトプット可能。<br>
スマホから操作可能で、レスポンシブ対応となっている。<br>
悩みや不安に対してTODOの保存やアクション宣言が可能。

# URL
https://moyamoya.onrender.com/

# テスト用アカウント
・ Basic認証ID ：admin<br>
・ Basic認証パスワード ：22223<br>
・ メールアドレス ：test1@test.com<br>
・ パスワード ：testtest11<br>

# 利用方法

## モヤモヤの吐き出し
1. ヘッダー部分から（モヤモヤ吐き出す）をクリック<br>
2. （素直な気持ち・モヤモヤの種類・モヤモヤの題名）を入力し保存する。<br>
3. （moyamoyaロゴ）をクリックし、モヤモヤ一覧から確認できる。<br>

## モヤモヤの詳細確認
1. モヤモヤ一覧ページから確認したいモヤモヤの（詳細）をクリック<br>
2. モヤモヤの詳細が確認できる。<br>
3. （このモヤモヤを削除）をクリックすると削除出来る。<br>
4. （解決に向けTODOを作成）をクリックするとTODO作成ページに遷移。<br>

## TODOの追加
1. ヘッダー部分から（TODOを追加する）もしくはモヤモヤの詳細ページから<br> （解決に向けTODOを作成）をクリック。<br>
2. （TODO・モヤモヤの種類・メモ・優先度）を入力し保存する。<br>
3. ヘッダー部分から（TODOを確認する）をクリックし、TODO一覧から確認出来る。<br>

## TODOの詳細確認
1. TODO一覧ページから確認したいTODOの（詳細）をクリック<br>
2. TODOの詳細が確認できる。<br>
3. （このTODOを完了）をクリックすると削除出来る。<br>
4. （このTODOを編集）をクリックすると編集が出来る。<br>
5. （このアクションを宣言する）をクリックすると宣言ページに遷移。<br>

## 宣言の追加
1. ヘッダー部分から（宣言する！）もしくはTODOの詳細ページから<br>
   （このアクションを宣言する）をクリック。
2. （これからやること！・コメント）を入力し保存する。<br>
3. ヘッダー部分から（みんなの宣言をみる）をクリックし、<br>
   みんなのアクション宣言から確認出来る。
4. 自分の宣言のみ確認する場合は、(○○でログイン中)をクリックし<br>
   マイページに遷移することで確認・削除可能。<br>

# アプリケーションを作成した背景
現代ではSNS等による情報の普及から不安や不満・劣等感を感じる若者が多く<br>
私もその一人だった。しかし、このモヤモヤは行動の原動力になるのではないかと考えた。<br>
そこで、そのモヤモヤを発散～行動へと変換する場所がないことが課題と考え、開発することにした。<br>

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1t47IvZXgotchNqBLOhaI5fxXQzASyna8cEhaPPKoidA/edit#gid=982722306


# 実装した機能について
[![Image from Gyazo](https://i.gyazo.com/f8bce86dcc5ceec04ecba83f16fb41fe.png)](https://gyazo.com/f8bce86dcc5ceec04ecba83f16fb41fe)<br>
モヤモヤとTODOの一覧画面はモヤモヤの種類ごとに表示位置を分割。

# 実装予定の機能
1. 文字にアニメーションを追加し、キャラクターが話している演出をする。<br>また、このアニメーションによりユーザーが落ち着く時間を提供できると考える。<br>
2. キャラクターからのメッセージをランダム化。<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/7d5a6d0416e2941dcd66c21b6df144d6.png)](https://gyazo.com/7d5a6d0416e2941dcd66c21b6df144d6)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/1c0a218cf86caf94e614888f38d2aec3.png)](https://gyazo.com/1c0a218cf86caf94e614888f38d2aec3)

# 開発環境
・フロントエンド：HTML、CSS、Bootstrap<br>
・バックエンド：Ruby、Ruby on Rails<br>
・インフラ：Render<br>
・データベース：PostgreSQL<br>
・テスト：Rspec<br>
・テキストエディタ：Visual Studio Code<br>

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/ohkuma90/moyamoya.git<br>
% cd e-s-paint<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント
ウェルカムページを準備し使用方法を明確にした。<br>
モヤモヤの吐き出し→TODOの保存→宣言までをすべて詳細から<br>
ボタンをクリックで遷移できるようにすることで<br>
ユーザーが次のアクションに迷いずらい設計とした。<br>

# データベース設計

# テーブル設計


## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |

### Association

- has_many :worries
- has_many :todos
- has_many :declarations


## worriesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| title       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## todosテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| title       | string     | null: false                    |
| memo        | text       | null: false                    |
| priority_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## declarations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| declaration | string     | null: false                    |
| comment     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user