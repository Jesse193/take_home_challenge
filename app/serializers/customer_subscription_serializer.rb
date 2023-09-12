class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  :data
  set_id :id
  set_type :customer_subscription
  attributes :status
  attributes :customer, :subscription
end