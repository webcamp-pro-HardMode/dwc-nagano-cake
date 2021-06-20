class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :postcode, :integer
    add_column :customers, :prefecture_code, :integer
    add_column :customers, :address_city, :string
    add_column :customers, :address_street, :string
    add_column :customers, :address_building, :string
  end
end
