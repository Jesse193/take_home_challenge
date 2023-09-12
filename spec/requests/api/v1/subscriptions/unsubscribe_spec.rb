require "rails_helper"

RSpec.describe "unsubscribe" do
  before(:each) do
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription = create(:subscription, tea_id: @tea.id)
  end
  describe "PATCH api/v1/customer_subscriptions" do
    it "can create subscription" do
      expect(Subscription.count).to eq(1)
      params = { customer_id: @customer.id, subscription_id: @subscription.id}
      post "/api/v1/customer_subscriptions", params: params
      subscription = JSON.parse(response.body, symbolize_names: true)
      params = { customer_subscription_id: subscription[:data][:id] }
      patch "/api/v1/customer_subscriptions/#{subscription[:data][:id]}"
      expect(response).to be_successful
      expect(response.status).to eq(200)
      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:data)
      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data][:type]).to eq("customer_subscription")
      expect(subscription[:data]).to have_key(:attributes)
      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to eq("unsubscribed")
      expect(subscription[:data][:attributes]).to have_key(:customer)
      expect(subscription[:data][:attributes]).to have_key(:subscription)
    end
  end
end