FactoryBot.define do
  factory :item do
   item_name        {"商品名"}
   description      {Faker::Lorem.sentence}
   category_id      {2}
   item_status_id   {2}
   shipping_cost_id {2}
   ship_from_id     {2}
   shipping_day_id  {2}
   price            {5000}

   association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end