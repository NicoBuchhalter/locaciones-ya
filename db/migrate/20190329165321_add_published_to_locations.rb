class AddPublishedToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :published, :boolean, default: false
    add_index :locations, :published
  end
end
