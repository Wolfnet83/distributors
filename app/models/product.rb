class Product < ActiveRecord::Base
  attr_accessible :brand_id, :brand_name, :product_id, :product_name
  has_many :remains
  set_primary_key :product_id 

  def self.import(csv_text)
    Product.delete_all
    CSV.foreach(csv_text.path, :headers => true, col_sep: ";", quote_char: "|", encoding: "cp1251") do |row|
      product = Product.new
      product.product_id = row["Product_ID"]
      product.product_name = row["Name_Product"]
      product.brand_id = row["Brand_ID"]
      product.brand_name = row["Name_Brand"]
      product.save
    end
  end

end
