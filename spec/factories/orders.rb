FactoryBot.define do
  factory :order do
    name "order 1"
    address "levan"
    sequence(:email) { |i| "email#{i}@email.com"}
    pay_type "WebMoney.UA"
    type_of_delivery "Автолюкс"
  end
end
