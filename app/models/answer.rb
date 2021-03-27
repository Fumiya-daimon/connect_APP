# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  content    :string(191)
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_answers_on_company_id  (company_id)
#  index_answers_on_post_id     (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (post_id => posts.id)
#
class Answer < ApplicationRecord
  belongs_to :company
  belongs_to :post

  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 1000 }
end
