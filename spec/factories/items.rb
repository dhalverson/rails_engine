FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Hipster.paragraph(sentence_count: 2) }
    unit_price { Faker::Commerce.price }
    # created_at { "2020-10-20 19:21:33" }
    # updated_at { "2020-10-17 19:21:33" }
    association :merchant
    # association :invoice
    # association :invoice_item
  end
end
