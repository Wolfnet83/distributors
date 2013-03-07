# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    product_id 1
    product_name "MyString"
    brand_id 1
    brand_name "MyString"
  end
end
