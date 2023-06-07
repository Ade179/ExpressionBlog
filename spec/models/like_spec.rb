require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      post: Post.new(
        author: User.new(
          name: 'juwon', photo: 'https://media.licdn.com/media/AAYQAQSOAAgAAQAAAAAAAB-zrMZEDXI2T62PSuT6kpB6qg.png',
          bio: 'student Microverse.',
          posts_counter: 0
        ), title: 'Hey', text: 'Programming in rails is wonderful',
        likes_counter: 0, comments_counter: 0
      ),
      author: User.new(name: 'chidera', photo: 'example.png', bio: 'Student at Microverse.',
                       posts_counter: 0)
    )
  end

  before { subject.save }

  it 'update_comments_counter should return a right result when called before save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
