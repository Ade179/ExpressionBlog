FactoryBot.define do
  factory :post do
    title { 'My Post Title' }
    text { 'This is the content of my post.' }
    comments_counter { 0 }
    likes_counter { 0 }
    author { association(:author) }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
