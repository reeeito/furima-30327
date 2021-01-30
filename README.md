# README

##users　テーブル
 has_many :products
 has_many :purchase_histories

| Column             | Type    | Option                   |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null:false               |
| email              | string  | null:false, unique:true  |
| encrypted_password | string  | null:false               |
| lastname           | string  | null:false               |
| firstname          | string  | null:false               |
| lastname_kana      | string  | null:false               |
| firstname_kana     | string  | null:false               |
| birthday           | date    | null:false               |

##products　テーブル
 belongs_to :user
 has_one :purchase_history

| Column           | Type       | Option           |
| ---------------- | ---------- | ---------------- |
| user             | references | foreign_key:true |
| productname      | string     | null:false       |
| explanation      | text       | null:false       |
| category_id      | integer    | null:false       |
| state_id         | integer    | null:false       |
| delivery_fee_id  | integer    | null:false       |
| area_id          | integer    | null:false       |
| delivery_time_id | integer    | null:false       |
| price            | integer    | null:false       |


##soldsテーブル
 belongs_to :purchase_history
 
| Column              | Type          | Option           |
| ------------------- | ------------- | ---------------- |
| postal_code         | string        | null:false       |
| area_id             | integer       | null:false       |
| municipaity         | string        | null:false       |
| address             | string        | null:false       |
| building_name       | string        |                  |
| tel                 | string        | null:false       |
| purchase_history    | references    | foreign_key:true |

##purchace_historyテーブル
  belongs_to :product
  belomgs_to :user
  has_one :sold

| Column   | Type       | Option                       |
| -------- | ---------- | ---------------------------- |
| user     | reference  | null:false, forein_key: true |
| product  | reference  | null:false, forein_key: true |