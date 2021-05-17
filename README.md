## Usersテーブル

|  Column             |   Type   |   Options                 |
|---------------------|----------|---------------------------|
| name                | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|  Column    |       Type   |   Options                      |
|------------|--------------|--------------------------------|
| description| text         | null: false                    |
| price      | integer      | null: false                    |
| image	     | string	      | null: false                    |
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
| buyer_id  | references   | null: false, foreign_key: true |

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
| telephone | string       | null: false                    |
| buyer_id  | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase