require 'test_helper'

class Manager::ManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_managers_index_url
    assert_response :success
  end

end
