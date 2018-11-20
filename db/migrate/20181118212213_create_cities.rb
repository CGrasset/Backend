class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :url_name
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :country_id

      t.timestamps
    end
  end
end
