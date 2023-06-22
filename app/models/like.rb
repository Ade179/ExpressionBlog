class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_likes_counter
  after_destroy :destroy_likes_counter

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end

  def destroy_likes_counter
    post.decrement!(:likes_counter)
  end
end
