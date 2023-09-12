FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.unique }
    temperature { Faker::Number.number(digits: 3) }
    brew_time { Faker::Number.number(digits: 2) }
  end
end
