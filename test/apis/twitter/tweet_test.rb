require 'test_helper'

class TwitterTweetTest < ActiveSupport::TestCase

  def setup
    @data = {"created_at"=>"Wed Mar 22 21:22:50 +0000 2017", "full_text" => "This is truncated...", "retweeted_status" => { "full_text" => "This is truncated... not! http://t.co/testing" } }
  end

  test "initialization" do
    assert Twitter::Tweet.new(@data)
  end

  test "#text returns the tweet text" do
    tweet = Twitter::Tweet.new(@data)
    assert tweet.text == "This is truncated... not! http://t.co/testing"
  end

  test "#created_at returns the date object" do
    tweet = Twitter::Tweet.new(@data)
    assert tweet.created_at.class == DateTime
  end

end
