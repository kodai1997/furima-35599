## Usersテーブル

|  Column   |   Type   |   Options   |
|-----------|----------|-------------|
| name      | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|  Column   |       Type   |   Options                      |
|-----------|--------------|--------------------------------|
| text      | text         | null: false                    |
| price     | integer      | null: false                    |
| user      | references   | null: false, foreign_key: true |

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
| address   | string       | null: false                    |
| user      | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase