# == Schema Information
#
# Table name: companyrequired_posts
#
#  id              :bigint           not null, primary key
#  content         :string(191)
#  required_person :string(191)
#  title           :string(191)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  company_post_id :bigint           not null
#
# Indexes
#
#  index_companyrequired_posts_on_company_id       (company_id)
#  index_companyrequired_posts_on_company_post_id  (company_post_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (company_post_id => company_posts.id)
#
class CompanyrequiredPost < ApplicationRecord
  belongs_to :company
  belongs_to :company_post

  validates :title, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 1000 }

  def company
    return Company.find_by(id: self.company_id)
  end
end
