require 'test_helper'

class CompanyroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get companyrooms_show_url
    assert_response :success
  end

end
