FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1 }
    merchant_id { "MyString" }
    merchant
  end
end
