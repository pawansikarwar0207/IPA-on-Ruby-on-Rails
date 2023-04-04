require "test_helper"

class UserPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_plan_index_url
    assert_response :success
  end
end
