FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.unique }
    price { Faker::Number.number(digits: 2) }
    frequency { Faker::Subscription.payment_term }
    tea
  end
end
