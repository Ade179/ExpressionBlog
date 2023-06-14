class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
