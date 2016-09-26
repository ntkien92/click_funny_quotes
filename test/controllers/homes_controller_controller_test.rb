require 'test_helper'

class HomesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homes_controller_index_url
    assert_response :success
  end

end
