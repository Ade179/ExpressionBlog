# spec/factories/authors.rb

FactoryBot.define do
  factory :author, class: 'User' do
    name { 'John Doe' }
    photo { 'https://example.com/photo.jpg' }
    bio { 'This is my bio.' }
    posts_counter { 0 }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
