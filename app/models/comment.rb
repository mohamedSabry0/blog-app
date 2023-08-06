class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true
  validates :text, presence: true, length: { maximum: 1000 }

  after_create :update_comments_counter_on_create
  after_destroy :update_comments_counter_on_destroy

  def update_comments_counter_on_create
    update_comments_counter(1)
  end

  def update_comments_counter_on_destroy
    update_comments_counter(-1)
  end

  def update_comments_counter(value)
    post.comments_counter += value
    post.save
  end
end
