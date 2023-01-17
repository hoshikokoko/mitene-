require "test_helper"

class Admin::InfomationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_infomations_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_infomations_show_url
    assert_response :success
  end
end
