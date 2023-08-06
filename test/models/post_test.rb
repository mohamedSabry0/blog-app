require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should not save post without title' do
    post = Post.new
    assert_not post.save
  end

  test 'should not save post without user' do
    post = Post.new
    assert_not post.save
  end

  test 'should save post with title' do
    post = Post.new
    post.title = 'Hello'
    assert post.save
  end

  test 'should not save post with title longer than 250 characters' do
    post = Post.new
    post.title = 'a' * 251
    assert_not post.save
  end

  test 'should not save post with negative comments_counter' do
    post = Post.new
    post.title = 'Hello'
    post.comments_counter = -1
    assert_not post.save
  end

  test 'should not save post with negative likes_counter' do
    post = Post.new
    post.title = 'Hello'
    post.likes_counter = -1
    assert_not post.save
  end

  test 'should not save post with fractional comments_counter' do
    post = Post.new
    post.title = 'Hello'
    post.comments_counter = 1.5
    assert_not post.save
  end

  test 'should not save post with fractional likes_counter' do
    post = Post.new
    post.title = 'Hello'
    post.likes_counter = 1.5
    assert_not post.save
  end
end
