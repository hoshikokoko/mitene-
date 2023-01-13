require "test_helper"

class Staff::InfomationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get staff_infomations_new_url
    assert_response :success
  end

  test "should get create" do
    get staff_infomations_create_url
    assert_response :success
  end

  test "should get index" do
    get staff_infomations_index_url
    assert_response :success
  end

  test "should get show" do
    get staff_infomations_show_url
    assert_response :success
  end

  test "should get edit" do
    get staff_infomations_edit_url
    assert_response :success
  end

  test "should get update" do
    get staff_infomations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get staff_infomations_destroy_url
    assert_response :success
  end
end
