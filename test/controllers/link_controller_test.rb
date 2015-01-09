require 'test_helper'

class LinkControllerTest < ActionController::TestCase
  test "should get ueber" do
    get :ueber
    assert_response :success
  end

end
