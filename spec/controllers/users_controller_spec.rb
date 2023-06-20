require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    describe 'GET index' do
      before(:example) do
        get '/users'
      end

      it 'is successful' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'displays the correct body placeholder text' do
        expect(response.body).to include('Users')
      end
    end

    describe 'GET show' do
      it 'is successful' do
        user = create(:user)
        get "/users/#{user.id}"
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        user = create(:user)
        get "/users/#{user.id}"
        expect(response).to render_template(:show)
      end

      it 'displays the correct body placeholder' do
        user = create(:user)
        get "/users/#{user.id}"
        expect(response.body).to include('Here is a specific user')
      end
    end
  end
end
