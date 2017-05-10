require 'test_helper'

class AffiliatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get affiliates_index_url
    assert_response :success
  end

  test "should get show" do
    get affiliates_show_url
    assert_response :success
  end

  test "should get new" do
    get affiliates_new_url
    assert_response :success
  end

  test "should get edit" do
    get affiliates_edit_url
    assert_response :success
  end

  test "should get delete" do
    get affiliates_delete_url
    assert_response :success
  end

end
