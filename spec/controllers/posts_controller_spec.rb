require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) } # Assuming you have a User factory set up

    context 'with valid parameters' do
      let(:post_params) { { post: { title: 'Test Post', text: 'Lorem ipsum' } } }

      it 'creates a new post' do
        expect do
          post :create, params: post_params, session: { user_id: user.id }
        end.to change(Post, :count).by(1)
      end

      it "redirects to the user's posts index" do
        post :create, params: post_params, session: { user_id: user.id }
        expect(response).to redirect_to("#{user_posts_path(user)}/")
      end

      it 'sets a flash notice message' do
        post :create, params: post_params, session: { user_id: user.id }
        expect(flash[:notice]).to eq('Success Post Saved!')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_post_params) { { post: { title: '', text: '' } } }

      it 'does not create a new post' do
        expect do
          post :create, params: invalid_post_params, session: { user_id: user.id }
        end.not_to change(Post, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_post_params, session: { user_id: user.id }
        expect(response).to render_template(:new)
      end

      it 'sets a flash error message' do
        post :create, params: invalid_post_params, session: { user_id: user.id }
        expect(flash[:error]).to eq('Error occurred with Post!')
      end
    end
  end
end
