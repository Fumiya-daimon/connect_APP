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
require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
