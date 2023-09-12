require "rails_helper"

RSpec.describe "subscription create" do
  before(:each) do
    @customer = create(:customer)
    @tea = create(:tea)
  end
  describe "POST api/v1/subscriptions" do
    xit "can create subscription" do
      expect(Subscription.count).to eq(0)
      params = { customer_id: @customer, tea_id: @tea }
      post "api/v1/subscriptions", params: params
      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end