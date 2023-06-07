require 'rails_helper'

RSpec.describe Post, type: :model do
  # Test associations
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

  # Test callbacks
  describe 'after_save' do
    let(:post) { create(:post) }
    let(:author) { post.author }

    it 'should call update_posts_counter' do
      expect(post).to receive(:update_posts_counter)
      post.save
    end

    it 'should increment posts_counter of the author' do
      expect { post.save }.to change { author.reload.posts_counter }.by(1)
    end
  end

  # Test validations
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  # Test private methods
  describe 'private methods' do
    let(:post) { create(:post) }

    describe '#update_posts_counter' do
      let(:author) { post.author }

      it 'should increment posts_counter of the author' do
        expect { post.send(:update_posts_counter) }.to change { author.reload.posts_counter }.by(1)
      end
    end
  end
end
