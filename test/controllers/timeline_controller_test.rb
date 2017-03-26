require 'test_helper'

class TimelineControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    @user = User.create!(email: 'sfsekaran@gmail.com', password: 'test')

    get timeline_url(id: '@support', as: @user), params: { format: 'text/html' }
    assert_response :success

    @user.destroy
  end

  test "should require authentication" do
    get timeline_url(id: '@support'), params: { format: 'text/html' }
    assert_response :found # redirect
  end
end
