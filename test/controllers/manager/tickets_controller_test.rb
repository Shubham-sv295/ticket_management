require 'test_helper'

class Manager::TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_tickets_index_url
    assert_response :success
  end

end
