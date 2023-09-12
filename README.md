<h1> This is a practice take home challenge for Turing School of Software and Design </h1>

<h3> The goal was to make a mock BE API for subscribing to a tea service</h3>

Rails V. 7.0.8

Ruby V. 3.2.2

Gems: 

* "factory_bot_rails"

  Used to fake data for testing

* "faker"
  
  Used to fake data for testing
  
* "pry"

* "shoulda-matchers"

<h4> Subscribe to Service </h4>

`params = { customer_id: @customer.id, subscription_id: @subscription.id}`

`post "/api/v1/customer_subscriptions", params: params`

returns:  

`{:data=>
  {:id=>"271",
   :type=>"customer_subscription",
   :attributes=>
    {:status=>"subscribed",
     :customer=>
      {:id=>215,
       :first_name=>"Gia",
       :last_name=>"Laverne",
       :email=>"marco.kessler@swaniawski.example",
       :address=>"476 Robert Forks, Alyseshire, KY 32236",
       :created_at=>"2023-09-12T21:36:16.400Z",
       :updated_at=>"2023-09-12T21:36:16.400Z"},
     :subscription=>
      {:id=>287,
       :title=>"monthly tea",
       :price=>13.0,
       :frequency=>"monthly",
       :tea_id=>287,
       :created_at=>"2023-09-12T21:36:16.402Z",
       :updated_at=>"2023-09-12T21:36:16.402Z"}}}}`

<h3>Unsubscribing from service</h3>

`patch "/api/v1/customer_subscriptions/#{subscription[:data][:id]}"`

returns:  

`{:data=>
  {:id=>"271",
   :type=>"customer_subscription",
   :attributes=>
    {:status=>"unsubscribed",
     :customer=>
      {:id=>215,
       :first_name=>"Gia",
       :last_name=>"Laverne",
       :email=>"marco.kessler@swaniawski.example",
       :address=>"476 Robert Forks, Alyseshire, KY 32236",
       :created_at=>"2023-09-12T21:36:16.400Z",
       :updated_at=>"2023-09-12T21:36:16.400Z"},
     :subscription=>
      {:id=>287,
       :title=>"monthly tea",
       :price=>13.0,
       :frequency=>"monthly",
       :tea_id=>287,
       :created_at=>"2023-09-12T21:36:16.402Z",
       :updated_at=>"2023-09-12T21:36:16.402Z"}}}}`

<h3>All subscriptions by customer</h3>

`params = { customer_id: @customer.id, subscription_id: @subscription_2.id}`

`post "/api/v1/customer_subscriptions", params: params`

returns: 

`{:data=>
  [{:id=>"279",
    :type=>"customer_subscription",
    :attributes=>
     {:status=>"subscribed",
      :customer=>
       {:id=>221,
        :first_name=>"Marquerite",
        :last_name=>"Zofia",
        :email=>"adolfo@kreiger.test",
        :address=>"92590 Wehner Gateway, East Tamekaport, VT 24506-6285",
        :created_at=>"2023-09-12T21:46:22.153Z",
        :updated_at=>"2023-09-12T21:46:22.153Z"},
      :subscription=>
       {:id=>295,
        :title=>"monthly tea",
        :price=>33.0,
        :frequency=>"monthly",
        :tea_id=>295,
        :created_at=>"2023-09-12T21:46:22.165Z",
        :updated_at=>"2023-09-12T21:46:22.165Z"}}},
   {:id=>"280",
    :type=>"customer_subscription",
    :attributes=>
     {:status=>"subscribed",
      :customer=>
       {:id=>221,
        :first_name=>"Marquerite",
        :last_name=>"Zofia",
        :email=>"adolfo@kreiger.test",
        :address=>"92590 Wehner Gateway, East Tamekaport, VT 24506-6285",
        :created_at=>"2023-09-12T21:46:22.153Z",
        :updated_at=>"2023-09-12T21:46:22.153Z"},
      :subscription=>
       {:id=>296,
        :title=>"monthly tea",
        :price=>67.0,
        :frequency=>"monthly",
        :tea_id=>296,
        :created_at=>"2023-09-12T21:46:22.167Z",
        :updated_at=>"2023-09-12T21:46:22.167Z"}}}]}`
