FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
    created_at { "2020-10-17 19:29:25" }
    updated_at { "2020-10-18 19:29:25" }
  end
end
