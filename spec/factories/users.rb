FactoryBot.define do
  factory :user do
    name              {'test'}
    email           {Faker::Internet.email}
    password              {'000000a'}
    password_confirmation {password}
    family_name             {'試験'}
    first_name              {'太朗'} 
    family_name_kana        {'テスト'} 
    first_name_kane         {'タロウ'} 
    birth_date              {'1997-10-10'}
  end
end