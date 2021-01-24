# README

##users　テーブル
 has_many :products, purchase_history

| Column         | Type    | Option                   |
| -------------- | ------- | ------------------------ |
| nickname       | string  | null:false               |
| email          | string  | null:false, unique:true  |
| password       | string  | null:false               |
| lastname       | string  | null:false               |
| firstname      | string  | null:false               |
| lastname_cana  | string  | null:false               |
| firstname_cana | string  | null:false               |
| birthday       | date    | null:false               |

##products　テーブル
 belongs_to :user
 has_one :purchase_history

| Column           | Type       | Option     |
| ---------------- | ---------- | ---------- |
| user             | references |            |
| productname      | string     | null:false |
| explanation      | text       | null:false |
| category_id      | string     | null:false |
| state_id         | integer    | null:false |
| delivery_fee_id  | integer    | null:false |
| area_id          | integer    | null:false |
| delivery_time_id | integer    | null:false |
| price            | integer    | null:false |


##soldsテーブル
 has_one :purchase_history
 
| Column           | Type          | Option     |
| ---------------- | ------------- | ---------- |
| postal_code      | string        | null:false |
| area_id          | integer       | null:false |
| municipaity      | string        | null:false |
| address          | string        | null:false |
| building_name    | string        |            |
| tel              | string        | null:false |

##purchace_historyテーブル
  has_one :user, products

| Column   | Type       | Option     |
| -------- | ---------- | ---------- |
| user     | reference  | null:false |
| product  | reference  | null:false |