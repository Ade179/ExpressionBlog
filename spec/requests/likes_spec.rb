require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /new' do
    before(:example) do
      @user = User.create(name: 'Daniel',
                          photo: 'https://picsum.photos/200/500',
                          bio: 'El cashico', posts_counter: 4)

      @post1 = Post.create(author: @user, title: 'Dudes', text: 'Theon Greyjoy', likes_counter: 0,
                           comments_counter: 0)

      @like1 = Like.create(author: @user, post: @post1)
      @like2 = Like.create(author: @user, post: @post1)
      @like3 = Like.create(author: @user, post: @post1)
    end

    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post1.id}"
      expect(response).to have_http_status(200)
    end
  end
end
