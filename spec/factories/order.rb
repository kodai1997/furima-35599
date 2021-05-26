FactoryBot.define do
  factory :order do
    zip_code              {'123-4567'}
    prefecture_id           {3}
    city                   {'世田谷区'}
    address                {'道玄坂'}
    telephone               {12345678901}
    token                {"tok_abcdefghijk00000000000000000"}
    item_id              {1}
    user_id               {1}
  end
end
