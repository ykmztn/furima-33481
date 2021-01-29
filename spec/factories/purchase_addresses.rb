FactoryBot.define do
  factory :purchase_address do

    user_id  { 1 }
    item_id  { 1 }
    postal_code  { '123-4567' }
    prefecture_id  { 2 }
    city  { '千代田区' }
    house_number  { '丸の内３ー１' }
    building { '新東京ビル４F' }
    phone_number  { '09012345678' }
    
  end
end
