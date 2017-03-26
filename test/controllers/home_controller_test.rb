require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/'
    assert_response :success
  end

  test "#timeline_redirect should redirect to timeline" do
    get '/timeline_redirect?username=support'
    assert_response :redirect
  end

end
