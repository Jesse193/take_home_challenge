class CreateCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_subscriptions do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :status, default: 1
      
      t.timestamps
    end
  end
end
