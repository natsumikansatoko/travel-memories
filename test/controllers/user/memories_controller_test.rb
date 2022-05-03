require "test_helper"

class User::MemoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_memories_new_url
    assert_response :success
  end

  test "should get create" do
    get user_memories_create_url
    assert_response :success
  end

  test "should get index" do
    get user_memories_index_url
    assert_response :success
  end

  test "should get show" do
    get user_memories_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_memories_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_memories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_memories_destroy_url
    assert_response :success
  end
end
