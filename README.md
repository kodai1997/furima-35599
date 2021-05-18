## Usersテーブル

|  Column             |   Type   |   Options                 |
|---------------------|----------|---------------------------|
| name                | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| family_name	        | string	 | null: false               |
| first_name          |	string	 | null: false               |
| family_name_kana    |	string   | null: false               |
| first_name_kane     |	string   | null: false               |
| birth_date          | date     | null: false               |


### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|  Column          |       Type   |   Options                      |
|------------------|--------------|--------------------------------|
| name             | string         | null: false                    |
| description      | text         | null: false                    |
| user             | references   | null: false, foreign_key: true |
| price            | integer      | null: false                    |
| status_id	       | integer      | null: false                    |
| shipping_cost_id | integer      | null: false                    |
| shipping_days_id | integer      | null: false                    |
| prefecture_id    | integer      | null: false                    |
| category_id      | integer      | null: false                    |

### Association
- belongs_to :user
- has_one :purchase


## Purchasesテーブル

|  Column   |       Type   |   Options                      |
|-----------|--------------|--------------------------------|
| item      | references   | null: false, foreign_key: true |
| user      | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## 	Shipping_addressesテーブル

|  Column      |       Type   |   Options                       |
|--------------|--------------|---------------------------------|
| zip_code     | string       | null: false                     |
| prefecture_id| integer      | null: false                     |
| city         | string       | null: false                     |
| address      | string       | null: false                     |
| address2     | string       |                                 |
| telephone    | string       | null: false                     |
| purchase     | references   | null: false, foreign_key: true  |

### Association
- belongs_to :purchase