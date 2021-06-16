class AddItemIdToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :item_id, :integer
  end
end
