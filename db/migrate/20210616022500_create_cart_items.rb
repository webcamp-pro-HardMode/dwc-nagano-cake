class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|

      t.integer :count

      t.timestamps
    end
  end
end
