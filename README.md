# README

##users　テーブル
 has_many :products, solds, purchase_history

| Column         | Type    | Option     |
| -------------- | ------- | ---------- |
| nickname       | string  | null:false |
| email          | string  | null:false |
| password       | string  | null:false |
| lastname       | string  | null:false |
| firstname      | string  | null:false |
| lastname_cana  | string  | null:false |
| firstname_cana | string  | null:false |
| birrhday       | date    | null:false |

##products　テーブル
 belong_to :uses
 has_one :purchase_history

| Column       | Type       | Option     |
| ------------ | ---------- | ---------- |
| user         | references |            |
| productname  | string     |            |
| explanation  | text       | null:false |
| category     | string     | null:false |
| state        | integer    | null:false |
| delivery_fee | integer    | null:false |
| area         | integer    | null:false |
| price        | integer    | null:false |

##soldsテーブル
 belong_to :uses, products
 has_one :purchase_history
 
| Column           | Type          | Option     |
| ---------------- | ------------- | ---------- |
| user             | reference     |            |
| product          | reference     |            |
| postal_code      | string        | null:false |
| prefectures      | string        | null:false |
| municipaity      | string        | null:false |
| address          | string        | null:false |
| building_name    | string        |            |
| tel              | string        | null:false |

##purchace_historyテーブル
  has_one :users, products, solds 

| Column   | Type       | Option     |
| -------- | ---------- | ---------- |
| user     | reference  |            |
| product  | reference  |            |
| sold     | reference  |            |  