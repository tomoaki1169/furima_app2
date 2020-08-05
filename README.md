@ -1,24 +1,65 @@
# README
* Deployment instructions

This README would normally document whatever steps are necessary to get the
application up and running.
* ...

Things you may want to cover:

## usersテーブル

* Ruby version
|Column|Type|Options|
|--------|------|-------|
|    name|string|null: false|
|    mail|string|null: false,unique: true|
|password|string|null: false|

* System dependencies
### Association
- has_many :products
- has_many :profiels
- has_many :creditcards
- has_many :addreses


* Configuration
## productsテーブル

* Database creation
|Column|Type|Options|
|--------|------|-------|
|    name|string|null: false|
|   price|string|null: false|
|   image|string|null: false|
|derivervy-fee|string|null:false|
|    size|string|null: false|
|  status|string|null: false|
|    date|string|null: false|
|    area|string|null: false|
|   introduction|string|null: false|
|user-id|string|null:false ,forign_key:true|
|brand-id|string|null:false,forign_key:true|
|category-id|string|null:false,forign_key:true|


* Database initialization
### Association
- belongs_to :user
- has_many :brands
- has_many :categories

* How to run the test suite
## categroriesテーブル

|Column|Type|Options|
|------|----|-------|
|  name|string|null: false|
|ancesty|string|          |

### Association
- belongs_to :products
*ancestryは、gem ancestryを使用するため

## credit-cardsテーブル

|Column|Type|Options|
|card-company|string|null: false|
|card-number|string|null: false|
|card-year|string|null: false|
|card-manth|string|null: false|
|card-pass|string|null: false|

### Association
- belongs_to :users



## addressesテーブル

|Column|Type|Options|
|prefecture|string|null: false|
|post-code|string|null: false|
|municipality|string|null: false|

## Association
- belongs_to :users


## brandsテーブル

|Column|Type|Options|
|name|string|null: false|

## Association
- belongs_to :products

## profiesテーブル

|Column|Type|Options|
|family-name| string| null: false|
|family-name-kana|string|null :false|
|first-name|string|null :false|
|first-name-kana|string|null :false|
|birth-year|string|null :false|
|birth-month|string|null :false|
|birth-day|string|null :false|

## Association
- belongs_to :users


![image](https://slack-imgs.com/?c=1&o1=ro&url=https%3A%2F%2Fi.gyazo.com%2F510cfad5435950d618167bdd2f45b13f.png)