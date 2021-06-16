class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :shipping_cost
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.integer :total_cost


      t.timestamps
    end
  end
end
