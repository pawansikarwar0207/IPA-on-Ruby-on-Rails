require "test_helper"

class UserReactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_reactions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_reactions_destroy_url
    assert_response :success
  end
end
