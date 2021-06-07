require 'test_helper'

class Manager::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_home_index_url
    assert_response :success
  end

end
