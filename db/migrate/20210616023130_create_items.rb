class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name
      t.integer :price
      t.text :introduction
      t.boolean :is_status, default: true, null: false
      t.string :image_id

    end
  end
end
