class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_comments_counter
  after_destroy :destroy_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  def destroy_comments_counter
    post.decrement!(:comments_counter)
  end
end
