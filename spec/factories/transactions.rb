FactoryBot.define do
  factory :transaction do
    invoice_id { "MyString" }
    credit_card_number { Faker::Business.credit_card_number }
    credit_card_expiration { Faker::Business.credit_card_expiry_date }
    result { "MyString" }
    created_at { "2020-10-17 19:30:53" }
    updated_at { "2020-10-17 19:30:53" }
    invoice
  end
end
