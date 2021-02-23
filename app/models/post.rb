class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :tag, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 1000 }
end
