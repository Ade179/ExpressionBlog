class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:author])
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_data)
    post.likes_counter = 0
    post.comments_counter = 0

    respond_to do |format|
      format.html do
        if post.save
          redirect_to "/users/#{post.author_id}/posts/", notice: 'Success Post Saved!'
        else
          flash.now[:error] = 'Error occurred with Post!'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_data
    params.require(:post).permit(:title, :text)
  end
end
