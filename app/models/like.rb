class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true

  after_create :update_likes_counter_on_create
  after_destroy :update_likes_counter_on_destroy

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
