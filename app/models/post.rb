class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_posts_counter_on_create
  after_destroy :update_posts_counter_on_destroy
  after_save :update_posts_counter_on_save

  def update_posts_counter_on_save
    author.posts_counter += 1
    author.save
  end

  def five_most_recent_own_comments
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end

  def update_posts_counter_on_create
    update_posts_counter(1)
  end

  def update_posts_counter_on_destroy
    update_posts_counter(-1)
  end

  def update_posts_counter(value)
    author.posts_counter += value
    author.save
  end
end
