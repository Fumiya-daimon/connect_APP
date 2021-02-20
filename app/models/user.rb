class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :image, {presence: true}
  validates :job, {presence: true, length: {maximum: 30}}
  validates :skill, {presence: true, length: {maximum: 20}}
end
