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
|derivervy_fee|string|null:false|
|    size|string|null: false|
|  status|string|null: false|
|    date|string|null: false|
|    area|string|null: false|
|   introduction|string|null: false|
|user_id|string|null:false ,forign_key:true|
|brand_id|string|null:false,forign_key:true|
|category_id|string|null:false,forign_key:true|


* Database initialization
### Association
- belongs_to :user
- belongs_to :brands
- belongs_to :categories
- has_many :images

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
|card_company|string|null: false|
|card_number|string|null: false|
|card_year|string|null: false|
|card_manth|string|null: false|
|card_pass|string|null: false|

### Association
- has_many :users



## addressesテーブル

|Column|Type|Options|
|prefecture|string|null: false|
|post_code|string|null: false|
|municipality|string|null: false|
｜jp_prefecture｜string|       |

## Association
- belongs_to :users
*jp_prefectureは、gem jp_prefectureを使用するため




## brandsテーブル

|Column|Type|Options|
|name|string|null: false|

## Association
- has_many :products

## profilesテーブル

|Column|Type|Options|
|family_name| string| null: false|
|family_name_kana|string|null :false|
|first_name|string|null :false|
|first_name_kana|string|null :false|
|birth_year|string|null :false|
|birth_month|string|null :false|
|birth_day|string|null :false|

## Association
- belongs_to :users


## imageテーブル

|Column|Type|Options|
|image|string|null:false|
|products_id|integer|null: false,foreign_key:true|

## Association
belongs_to :product


![image](https://files.slack.com/files-pri/TK2M4NQC8-F018AGG2DPD/____________________________2020-08-05_15.46.55.png)