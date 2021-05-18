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
| birth_year          | string   | null: false               |
| birth_month         | string   | null: false               |
| birth_day           | string   | null: false               |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|  Column    |       Type   |   Options                      |
|------------|--------------|--------------------------------|
| description| text         | null: false                    |
| price      | integer      | null: false                    |
| status	   | string       |	null: false                    |
| seller_id  | references   | null: false, foreign_key: true |
| buyer_id   | references   | null: false, foreign_key: true |

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
- has_one :address


## 	Shipping_addressesテーブル

|  Column   |       Type   |   Options                      |
|-----------|--------------|--------------------------------|
| zip_code  | integer      | null: false                    |
| prefecture| string       | null: false                    |
| city      | string       | null: false                    |
| address   | string       | null: false                    |
| address2  | string       |                                |
| telephone | string       | null: false                    |
| user      | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase