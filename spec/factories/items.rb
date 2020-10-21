FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    unit_price { Faker::Commerce.price }
    association :merchant
    # association :invoice
    # association :invoice_item
  end
end
