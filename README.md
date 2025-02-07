# README

## Usersテーブル

|Column   |Type|Options|
|-   -----|----|-------|
|nickname | string |null: false|
|email    | string |null: false|
|password | string |null: false|
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
|item_name    | string |null: false|
|detail       | text   |null: false|
|category     | DATE   |null: false|
|state        | DATE   |null: false|
|delivery     | DATA   |null: false|
|place        | DATA   |null: false|
|dispatch_days| DATA   |null: false|
|price        | string |null: false|
|exhibitor    | string |null: false|

イメージ写真、商品名、商品説明、カテゴリー、状態、配送料負担、地域、発送までの日数、値段、出品者

### Association
- belongs_to :user
- has_one :buy
- belongs_to :information



## Buy(購入記録)テーブル

|Column        |Type        |Options|
|--------------|------------|-------|
|price         | references | null: false ,外部キー|
|payment_method| DATE       |null: false|
|payment_limit | DATE       |null: false|
|payment_cord  | DATE       |null: false|

### Association

- belongs_to :user
- belomgs_to :item
- belongs_to :information

クレカ情報、有効期限月、年、セキュリティーコード
購入に関するテーブルの設計は、最終課題補足カリキュラムLesson1の「クレジットカード決済機能ミニアプリを作成しよう」を参考にしましょう。
DB設計後によくある間違い

## Information(発送先情報)テーブル

|Column|Type |Options|
|------|-----|-------|
|postal_code | string |null: false|
|prefecture  | string |null: false|
|city        | string |null: false|
|address     | string |null: false|
|building    | string |null: true |
|phone_number| string |null: false|

### Association

- belongs_to :user
- belomgs_to :item
- belongs_to :buy

郵便番号、都道府県、市区町村、番地、建物名（任意）、電話番号