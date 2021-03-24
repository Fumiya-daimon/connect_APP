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
  has_many :comments
  has_many :answers
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :tag, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 1000 }

  def user
    return User.find_by(id: self.user_id)
  end
end
