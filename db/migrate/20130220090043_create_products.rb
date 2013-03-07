class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.integer :brand_id
      t.string :brand_name

      t.timestamps
    end
  end
end
