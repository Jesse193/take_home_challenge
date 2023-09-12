class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
  enum status: {unsubscribed: 0, subscribed: 1}
end