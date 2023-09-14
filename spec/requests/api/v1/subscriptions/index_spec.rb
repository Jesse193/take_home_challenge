require "rails_helper"

RSpec.describe "all subscriptions" do
  before(:each) do
    @customer = create(:customer)
    @tea_1 = create(:tea)
    @tea_2 = create(:tea)
    @subscription_1 = create(:subscription, tea_id: @tea_1.id)
    @subscription_2 = create(:subscription, tea_id: @tea_2.id)
  end
  describe "GET api/v1/customer_subscriptions" do
    it "can create subscription" do
      params = { customer_id: @customer.id, subscription_id: @subscription_1.id}
      post "/api/v1/customer_subscriptions", params: params
      params = { customer_id: @customer.id, subscription_id: @subscription_2.id}
      post "/api/v1/customer_subscriptions", params: params

      get "/api/v1/customer/#{@customer.id}/customer_subscriptions"
      expect(response).to be_successful
      subscriptions = JSON.parse(response.body, symbolize_names: true)
      expect(subscriptions).to be_a(Hash)
      expect(subscriptions[:data].count).to eq(2)
      expect(subscriptions[:data][0]).to have_key(:type)
      expect(subscriptions[:data][0][:type]).to eq("customer_subscription")
      expect(subscriptions[:data][0]).to have_key(:attributes)
      expect(subscriptions[:data][0][:attributes]).to have_key(:status)
      expect(subscriptions[:data][0][:attributes][:status]).to eq("subscribed")
      expect(subscriptions[:data][0][:attributes]).to have_key(:customer)
      expect(subscriptions[:data][0][:attributes]).to have_key(:subscription)
    end
    it "raises error for invalid customer ID" do
      params = { customer_id: @customer.id, subscription_id: @subscription_1.id}
      post "/api/v1/customer_subscriptions", params: params
      params = { customer_id: @customer.id, subscription_id: @subscription_2.id}
      post "/api/v1/customer_subscriptions", params: params
      get "/api/v1/customer/100000/customer_subscriptions"
      expect(response.body).to eq("{\"error\":\"Couldn't find Customer with 'id'=100000\"}")
    end
  end
end