class RemoveGenresIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :genres_id, :integer
  end
end
