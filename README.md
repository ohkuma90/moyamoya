# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
| declaration | text       | null: false                    |
| comment     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user