FactoryBot.define do
  factory :invoice do
    status { 'shipped' }
    # created_at { "2020-10-20 19:21:33" }
    # updated_at { "2020-10-17 19:21:33" }
    association :customer
    association :merchant
  end
end
