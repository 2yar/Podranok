FactoryBot.define do
  factory :line_item do
    product
    cart
    quantity 2
  end
end
