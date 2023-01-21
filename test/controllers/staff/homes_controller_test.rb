require "test_helper"

class Staff::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get staff_homes_top_url
    assert_response :success
  end
end
