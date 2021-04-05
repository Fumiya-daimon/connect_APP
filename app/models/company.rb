# == Schema Information
#
# Table name: companies
#
#  id                     :bigint           not null, primary key
#  email                  :string(191)      default(""), not null
#  encrypted_password     :string(191)      default(""), not null
#  image                  :string(191)
#  industry               :string(191)
#  name                   :string(191)
#  remember_created_at    :datetime
#  required_person        :string(191)
#  reset_password_sent_at :datetime
#  reset_password_token   :string(191)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_companies_on_email                 (email) UNIQUE
#  index_companies_on_reset_password_token  (reset_password_token) UNIQUE
#
class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :company_post, dependent: :destroy
  has_many :companyrequired_post, dependent: :destroy
  has_many :companyrooms
  has_many :answers, dependent: :destroy

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :industry, presence: true
  validates :required_person, presence: true

  def company_posts
    return CompanyPost.where(company_id: self.id)
  end

  def companyrequired_posts
    return CompanyrequiredPost.where(company_id: self.id)
  end
end
