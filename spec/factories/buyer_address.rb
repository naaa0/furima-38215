FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { '大田区' }
    house_number { '仲池上1-1-1' }
    building_name { '東京ハイツ101' }
    phone { 11111111111 }
    token { Faker::Lorem.word }
  end
end