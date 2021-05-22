FactoryBot.define do
  factory :item do
    name                   {'test'}
    description            {'test'}
    category_id            {3}
    status_id              {2}
    shipping_cost_id       {2}
    prefecture_id          {23}
    shipping_days_id       {3}
    price                  {55555}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
