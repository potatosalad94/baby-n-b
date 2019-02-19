require 'test_helper'

class BabiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get babies_index_url
    assert_response :success
  end

  test "should get show" do
    get babies_show_url
    assert_response :success
  end

  test "should get new" do
    get babies_new_url
    assert_response :success
  end

  test "should get create" do
    get babies_create_url
    assert_response :success
  end

  test "should get edit" do
    get babies_edit_url
    assert_response :success
  end

  test "should get update" do
    get babies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get babies_destroy_url
    assert_response :success
  end

end
