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
| birrhday       | date    | null:false |

##products　テーブル

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