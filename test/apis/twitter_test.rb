require 'test_helper'

class TwitterTest < ActiveSupport::TestCase

  test "initialization" do
    assert Twitter.new
  end

  # TODO: we should cache the API call using VCR or similar so we don't hit Twitter every time we run this test.
  test "it gets the last 25 tweets for a user" do
    t = Twitter.new
    tweets = t.timeline('support')
    assert tweets.count == 25
  end

  test "it returns a Twitter::Tweet object" do
    t = Twitter.new
    tweets = t.timeline('support')
    assert tweets.first.class == Twitter::Tweet
  end

end
