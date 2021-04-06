# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthday               :date             not null
#  email                  :string(191)      default(""), not null
#  encrypted_password     :string(191)      default(""), not null
#  image                  :string(191)
#  job                    :string(191)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(191)
#  skill                  :string(191)      not null
#  username               :string(191)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  enum gender: { man: 0, woman: 1 }


  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :companyrooms


  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def posts
    return Post.where(user_id: self.id)
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
