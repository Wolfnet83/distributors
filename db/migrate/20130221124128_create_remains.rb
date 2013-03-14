class CreateRemains < ActiveRecord::Migration
  def change
    create_table :remains do |t|
      t.integer :product_id
      t.integer :distributor_id
      t.datetime :remain_date
      t.integer :remain

      t.timestamps
    end
  end
end
