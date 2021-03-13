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
require 'test_helper'

class CompanyrequiredPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
