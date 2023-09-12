require 'rails_helper'

RSpec.describe Customer, type: :model do
  it {should have_many(:subscriptions).dependent(:destroy)}
end
