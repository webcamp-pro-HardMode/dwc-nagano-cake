class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|

      t.timestamps
      t.integer :quantity
      t.integer :order_status,default: 0,null: false
      t.integer :price
      t.integer :total_price
    end
  end
end
