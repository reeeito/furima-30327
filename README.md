# README

##users　テーブル

| Column         | Type    | Option     |
| -------------- | ------- | ---------- |
| nickname       | string  | null:false |
| email          | string  | null:false |
| password       | string  | null:false |
| lastname       | string  | null:false |
| firstname      | text    | null:false |
| lastname_cana  | text    | null:false |
| firstname_cana | string  | null:false |
| birrhday       | string  | null:false |

##products　テーブル

| Column       | Type       | Option     |
| ------------ | ---------- | ---------- |
| img          | text       | null:false |
| user         | references |            |
| productname  | references |            |
| explanation  | text       | null:false |
| category     | string     | null:false |
| state        | string     | null:false |
| delivery_fee | string     | null:false |
| area         | string     | null:false |
| price        | string     | null:false |


##soldsテーブル
| Column           | Type          | Option     |
| ---------------- | ------------- | ---------- |
| user             | reference     |            |
| product          | reference     |            |
| card_information | string        | null:false |
| expiration       | string        | null:false |
| security_code    | string        | null:false |
| postal_code      | string        | null:false |
| prefectures      | string        | null:false |
| municipaity      | string        | null:false |
| address          | string        | null:false |
| building_name    | string        | null:false |
| tel              | string        | null:false |