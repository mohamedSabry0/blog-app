class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :author, presence: true
end
