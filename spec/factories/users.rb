FactoryBot.define do
  factory :user do
    nickname   { Faker::Name.initials }
    email      { Faker::Internet.free_email }
    password   { 'a1' + Faker::Internet.password(min_length: 4, mix_case: false) }
    password_confirmation { password }
    lastname   { 'やマ田' }
    firstname  { '太ろウ' }
    lastname_kana  { 'ヤマダ' }
    firstname_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
