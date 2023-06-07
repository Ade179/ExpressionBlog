# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User Name #{n}" }
    # Add any other attributes as needed
  end
end
