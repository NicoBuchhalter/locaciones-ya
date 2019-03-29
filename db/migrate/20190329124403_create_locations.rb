class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :province
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.float :size
      t.float :height
      t.text :description

      t.timestamps
    end
  end
end
