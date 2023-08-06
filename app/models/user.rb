class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  def most_recent_own_three_posts
    Post.where(author: self).order(created_at: :desc).limit(3)
  end
end
