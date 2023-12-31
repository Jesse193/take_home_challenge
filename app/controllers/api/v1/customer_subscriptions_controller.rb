class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.customer_subscriptions
    render json: CustomerSubscriptionSerializer.new(subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    customer_subscription = customer.customer_subscriptions.create!(subscription_id: subscription.id)
    render json: CustomerSubscriptionSerializer.new(customer_subscription)
  end

  def update
    customer_subscription = CustomerSubscription.find(params[:id])
    unsubscribed = customer_subscription.update(status: 0)
    render json: CustomerSubscriptionSerializer.new(customer_subscription)
  end

  private
  def subscription_params
    params.permit(:id, :title, :price, :status, :frequency, :tea_id)
  end
end