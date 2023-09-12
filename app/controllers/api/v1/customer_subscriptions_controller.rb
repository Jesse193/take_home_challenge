class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    customer_subscription = customer.customer_subscriptions.create!(subscription_id: subscription.id)
    if customer_subscription.save
      render json: CustomerSubscriptionSerializer.new(customer_subscription)
    end
  end

  def update
    customer_subscription = CustomerSubscription.find(params[:id])
    unsubscribed = customer_subscription.update(status: 0)
    if customer_subscription.save
      render json: CustomerSubscriptionSerializer.new(customer_subscription)
    end
  end

  private
  def subscription_params
    params.permit(:id, :title, :price, :status, :frequency, :tea_id)
  end
end