class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.integer :price

      t.timestamps
    end
  end
end
