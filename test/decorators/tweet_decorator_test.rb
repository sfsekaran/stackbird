require 'test_helper'

class TweetDecoratorTest < ActiveSupport::TestCase

  test "initialization" do
    tweet = Twitter::Tweet.new({})
    assert TweetDecorator.new(tweet)
  end

  test "returns simple text (no mentions)" do
    tweet = Twitter::Tweet.new({'full_text' => 'This is a simple tweet'})
    decorator = TweetDecorator.new(tweet)
    assert decorator.text == 'This is a simple tweet'
  end

  test "returns a string representation of the creation date" do
    tweet = Twitter::Tweet.new({'created_at' => 'Wed Mar 22 21:22:50 +0000 2017'})
    decorator = TweetDecorator.new(tweet)
    assert_equal 'Mar 22,  9:22 PM', decorator.created_at
  end

end
