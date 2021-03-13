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
require 'test_helper'

class CompanyPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
