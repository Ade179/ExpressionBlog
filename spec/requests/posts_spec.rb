require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/300/300', bio: 'Software Engineer from Nigeria')
    @user2 = User.create(name: 'Daniel', photo: 'https://picsum.photos/200/400', bio: 'Software Engineer from Nigeria')
    @post1 = Post.create(author: @user1, title: 'Great', text: 'Hello World!')
    Comment.create(author: @user1, post: @post1, text: 'it is not 3 pm yet and already I have had a day')
    Comment.create(author: @user1, post: @post1, text: 'what a post!')
    Like.create(author: @user1, post: @post1)
    Like.create(author: @user2, post: @post1)
    visit user_post_path(@user2, @post1)
  end
  it "show the post's title" do
    expect(page).to have_content(@post1.title)
  end
  it 'Show who wrote the post' do
    expect(page).to have_content(@post1.author.name)
  end
  it 'displays the comment count and like count' do
    expect(page).to have_content('comments:2 likes:2')
  end
  it 'Show the post body' do
    expect(page).to have_content(@post1.text)
  end
  it 'Show the username of each commentor' do
    @post1.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
  it 'Show the comment each commentor left' do
    @post1.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end


