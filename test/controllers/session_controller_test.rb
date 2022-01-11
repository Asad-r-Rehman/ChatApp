require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get ," do
    get session_,_url
    assert_response :success
  end

  test "should get chatroom" do
    get session_chatroom_url
    assert_response :success
  end

end
