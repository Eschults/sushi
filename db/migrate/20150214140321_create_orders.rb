class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :order_number
      t.datetime :pickup_date
      t.datetime :delivery_date
      t.boolean :paid
      t.integer :price_cents

      t.timestamps
    end
  end
end
