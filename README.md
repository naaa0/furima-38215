# テーブル設計

## usersテーブル

| Column              | Type   | Options     |
| ------              | ------ | ----------- |
| nickname            | string | null: false |
| mail                | string | null: false |
| encrypted_password  | string | null: false |
| lastname            | string | null: false |
| firstname           | string | null: false |
| lastname_kana       | string | null: false |
| firstname_kana      | string | null: false |
| birthday            | date   | null: false |


### Association
- has_many :items
- has_many :buyers


## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| ship_charge | string     | null: false                    |
| ship_region | string     | null: false                    |
| ship_date   | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association
- has_one :buyer
- belongs_to :user


## buyersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region        | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
