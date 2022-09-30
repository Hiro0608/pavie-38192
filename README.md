# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| family_name        | string              | null: false               |
| first_name_kana    | string              | null: false               |
| family_name_kana   | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :reservations
* has_many :orders


## reservations table 

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| price                               | integer    | null: false                    |
| introduction                        | text       | null: false                    |
| user                                | references | foreign_key: true              |
| active_id                           | integer    | null: false                    |
| equipment_id                        | integer    | null: false                    |
| trading_area_id                     | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order


## order table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address(未定)
