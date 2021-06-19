class AddGenresIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :genre_id, :integer
  end
end
