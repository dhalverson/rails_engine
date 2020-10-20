FactoryBot.define do
  factory :invoice_item do
    item_id { "MyString" }
    invoice_id { "MyString" }
    quantity { 1 }
    unit_price { 1 }
    created_at { "2020-10-17 19:29:25" }
    updated_at { "2020-10-17 19:29:25" }
    
  end
end
