class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :zip_code,             null: false
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false
      t.string :address,              null: false
      t.string :address2
      t.string :telephone,            null: false
      t.references :purchase,         foreign_key: true
      t.timestamps
    end
  end
end
