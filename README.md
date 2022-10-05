# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------              | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| lastname            | string | null: false               |
| firstname           | string | null: false               |
| lastname_kana       | string | null: false               |
| firstname_kana      | string | null: false               |
| birthday            | date   | null: false               |


### Association
- has_many :items
- has_many :buyers


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_bearer_id | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- has_one :buyer
- belongs_to :user


## buyersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer


