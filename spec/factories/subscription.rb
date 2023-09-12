FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.unique }
    price { Faker::Number.number(digits: 2) }
    status { Faker::Subscription.status  }
    frequency { Faker::Subscription.payment_term }
    tea
  end
end
