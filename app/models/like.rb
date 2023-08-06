class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_likes_counter_on_create
  after_destroy :update_likes_counter_on_destroy
  after_save :update_likes_counter_on_save

  def update_likes_counter_on_save
    post.likes_counter += 1
    post.save
  end

  def update_likes_counter_on_create
    update_likes_counter(1)
  end

  def update_likes_counter_on_destroy
    update_likes_counter(-1)
  end

  def update_likes_counter(value)
    post.likes_counter += value
    post.save
  end
end
