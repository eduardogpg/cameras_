require "test_helper"

class InstitutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get institutions_index_url
    assert_response :success
  end
end
