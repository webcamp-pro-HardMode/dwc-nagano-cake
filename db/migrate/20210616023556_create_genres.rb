class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :name
    end
  end
end
