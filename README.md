# README

## Usersテーブル

|Column   |Type|Options|
|-   -----|----|-------|
|nickname | string |null: false|
|email    | string |null: false, unique:true|
|encrypted_password | string |null: false|
|surname  | string |null: false|
|name     | string |null: false|
|surname_kana | string |null: false|
|name_kana | string |null: false|
|birthday | date   |null: false|

### Association
- has_many :items
- has_many :buys


## Items(商品情報)テーブル

|Column       |Type|Options|
|-------------|----|-------|
|title        | string |null: false|
|detail       | text   |null: false|
|category_id  | integer |null: false|
|state_id     | integer |null: false|
|delivery_id  | integer |null: false|
|place_id     | integer |null: false|
|dispatch_days_id | integer |null: false|
|price        | integer |null: false|
|user         | references |null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :buy



## Buys(購入記録)テーブル

|Column          |Type        |Options|
|---------------|------------|-------|
|user  | references |null: false, foreign_key: true|
|item  | references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :information


## Informations(発送先情報)テーブル

|Column        |Type        |Options|
|-------------|------------|-------|
|postal_code  | string     |null: false|
|place_id     | integer    |null: false|
|city         | string     |null: false|
|address      | string     |null: false|
|building     | string     |           |
|phone_number | string     |null: false|
|buy          | references |null: false, foreign_key: true|

### Association

- belongs_to :buy
