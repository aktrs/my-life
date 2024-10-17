require "test_helper"

class GraphsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get graphs_new_url
    assert_response :success
  end
end
