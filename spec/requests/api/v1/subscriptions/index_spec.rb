require "rails_helper"

RSpec.describe "all subscriptions" do
  before(:each) do
    @customer = create(:customer)
    @tea_1 = create(:tea)
    @tea_2 = create(:tea)
    @subscription_1 = create(:subscription, tea_id: @tea_1.id)
    @subscription_2 = create(:subscription, tea_id: @tea_2.id)
  end
  describe "POST api/v1/customer_subscriptions" do
    it "can create subscription" do
      params = { customer_id: @customer.id, subscription_id: @subscription_1.id}
      post "/api/v1/customer_subscriptions", params: params
      params = { customer_id: @customer.id, subscription_id: @subscription_2.id}
      post "/api/v1/customer_subscriptions", params: params

      get "/api/v1/customer/#{@customer.id}/customer_subscriptions"
      expect(response).to be_successful
      subscriptions = JSON.parse(response.body, symbolize_names: true)
      expect(subscriptions).to be_a(Array)
    end
  end
end