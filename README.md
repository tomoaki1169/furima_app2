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

* Configuration
## productsテーブル

* Database creation
|Column|Type|Options|
|--------|------|-------|
|    name|string|null: false|
|   price|string|null: false|
|password|string|null: false|
|   image|string|null: false|
|    size|string|null: false|
|  status|string|null: false|
|    date|string|null: false|
|    area|string|null: false|

* Database initialization
### Association
- belongs_to :user
- has_many :main_products

* How to run the test suite
## main_categroryテーブル

* Services (job queues, cache servers, search engines, etc.)
|Column|Type|Options|
|------|----|-------|
|  name|string|null: false|

* Deployment instructions
### Association
- belongs_to : products
- has_many : sub1_categrory

* ...
## sub1_categroryテーブル

|Column|Type|Options|
|------|----|-------|
|  name|string|null: false|

### Association
- belongs_to :sub1_categrory
- has_many : sub2_categrory

## sub2_categroryテーブル

|Column|Type|Options|
|------|----|-------|
|  name|string|null: false|

### Association
- belongs_to : sub1_categrory




![image](https://user-images.githubusercontent.com/67726297/89290513-f0666380-d693-11ea-9b1f-df324a92f77c.png)