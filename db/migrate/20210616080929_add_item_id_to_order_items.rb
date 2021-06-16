class AddItemIdToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :item_id, :integer
    add_column :order_items, :order_id, :integer
  end
end
