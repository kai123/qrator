require 'test_helper'

class QratorControllerTest < ActionController::TestCase
  test "should get generator" do
    get :generator
    assert_response :success
  end

end
