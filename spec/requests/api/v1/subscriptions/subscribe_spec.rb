require "rails_helper"

RSpec.describe "subscription create" do
  before(:each) do
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription = create(:subscription, tea_id: @tea.id)
  end
  describe "POST api/v1/customer_subscriptions" do
    it "can create subscription" do
      expect(Subscription.count).to eq(1)
      params = { customer_id: @customer.id, subscription_id: @subscription.id}
      post "/api/v1/customer_subscriptions", params: params
      expect(response).to be_successful
      expect(response.status).to eq(200)
      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:data)
      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data][:type]).to eq("customer_subscription")
      expect(subscription[:data]).to have_key(:attributes)
      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to eq("subscribed")
      expect(subscription[:data][:attributes]).to have_key(:customer)
      expect(subscription[:data][:attributes]).to have_key(:subscription)
    end
    it "raises error for invalid subscription ID" do
      params = { customer_id: @customer.id, subscription_id: 200}
      post "/api/v1/customer_subscriptions", params: params
      expect(response.body).to eq("{\"error\":\"Couldn't find Subscription with 'id'=200\"}")
    end
    it "raises error for invalid customer ID" do
      params = { customer_id: 10000, subscription_id: 200}
      post "/api/v1/customer_subscriptions", params: params
      expect(response.body).to eq("{\"error\":\"Couldn't find Customer with 'id'=10000\"}")
    end
  end
end