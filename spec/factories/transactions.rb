FactoryBot.define do
  factory :transaction do
    invoice_id { "MyString" }
    credit_card_number { "MyString" }
    credit_card_expiration { "MyString" }
    result { "MyString" }
    created_at { "2020-10-17 19:30:53" }
    updated_at { "2020-10-17 19:30:53" }
  end
end
