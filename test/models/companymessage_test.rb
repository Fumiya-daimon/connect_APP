# == Schema Information
#
# Table name: companymessages
#
#  id             :bigint           not null, primary key
#  content        :text(65535)
#  is_user        :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  companyroom_id :bigint           not null
#
# Indexes
#
#  index_companymessages_on_companyroom_id  (companyroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (companyroom_id => companyrooms.id)
#
require 'test_helper'

class CompanymessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
