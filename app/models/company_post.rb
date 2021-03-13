# == Schema Information
#
# Table name: company_posts
#
#  id         :bigint           not null, primary key
#  content    :string(191)
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :string(191)
#
class CompanyPost < ApplicationRecord
  belongs_to :company

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }

  def company
    return Company.find_by(id: self.company_id)
  end
end
