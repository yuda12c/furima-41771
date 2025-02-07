# README

## Usersテーブル

|Column   |Type|Options|
|-   -----|----|-------|
|nickname | string |null: false|
|email    | string |null: false|
|encrypted_password | string |null: false|
|surname  | string |null: false|
|name     | string |null: false|
|birthday | DATE   |null: false|

### Association
- has_many :items
- has_many :buys
- has_many :informations


## Items(商品情報)テーブル

|Column       |Type|Options|
|-------------|----|-------|
|title        | string |null: false|
|detail       | text   |null: false|
|category     | integer |null: false|
|state        | integer |null: false|
|delivery     | integer |null: false|
|place        | integer |null: false|
|dispatch_days_id | integer |null: false|
|price        | integer |null: false|
|user_id      | references |null: false, foreign_key: true|

イメージ写真、商品名、商品説明、カテゴリー、状態、配送料負担、地域、発送までの日数、値段、出品者

### Association
- belongs_to :user
- has_one :buy



## Buys(購入記録)テーブル

|Column          |Type        |Options|
|---------------|------------|-------|
|user_id        | references |null: false, foreign_key: true|
|item_id        | references |null: false, foreign_key: true|
|price          | integer    |null: false|
|payment_method | integer    |null: false| 
|card_expiration_date | string |null: false| 

### Association

- belongs_to :user
- belomgs_to :item


クレカ情報、有効期限月、年、セキュリティーコード
購入に関するテーブルの設計は、最終課題補足カリキュラムLesson1の「クレジットカード決済機能ミニアプリを作成しよう」を参考にしましょう。
DB設計後によくある間違い

## Informations(発送先情報)テーブル

|Column        |Type        |Options|
|-------------|------------|-------|
|postal_code  | string     |null: false|
|prefecture_id| integer    |null: false| 
|city         | string     |null: false|
|address      | string     |null: false|
|building     | string     |null: true |
|phone_number | string     |null: false|
|user_id      | references |null: false, foreign_key: true|
|buy_id       | references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :buy

郵便番号、都道府県、市区町村、番地、建物名（任意）、電話番号