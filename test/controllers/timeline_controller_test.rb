require 'test_helper'

class TimelineControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timeline_url(id: '@support'), params: { format: 'text/html' }
    assert_response :success
  end
end
