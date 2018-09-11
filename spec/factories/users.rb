FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "123456789"
    admin false
  end

  factory :admin, class: User do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "123456789"
    admin true
  end
end
