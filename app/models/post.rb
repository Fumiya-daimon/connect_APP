# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  image      :string(191)
#  tag        :string(191)
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }

  def user
    return User.find_by(id: self.user_id)
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
