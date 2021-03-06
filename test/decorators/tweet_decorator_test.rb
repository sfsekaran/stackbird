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

  test "returns a link when it encounters a mention" do
    tweet = Twitter::Tweet.new({'full_text' => 'This is not a simple tweet, @support'})
    decorator = TweetDecorator.new(tweet)
    assert_equal 'This is not a simple tweet, <a href="/timeline/support">@support</a>', decorator.text
  end

  test "replaces newlines with <br /> tags" do
    tweet = Twitter::Tweet.new({'full_text' => "new\nline"})
    decorator = TweetDecorator.new(tweet)
    assert_equal 'new<br />line', decorator.text
  end

  test "returns a string representation of the creation date" do
    tweet = Twitter::Tweet.new({'created_at' => 'Wed Mar 22 21:22:50 +0000 2017'})
    decorator = TweetDecorator.new(tweet)
    assert_equal 'Mar 22,  9:22 PM', decorator.created_at
  end

  test "urls get turned into links" do
    tweet = Twitter::Tweet.new({'full_text' => 'Please go to https://www.google.com/ for more info!'})
    decorator = TweetDecorator.new(tweet)
    expected = 'Please go to <a href="https://www.google.com/">https://www.google.com/</a> for more info!'
    assert_equal expected, decorator.text
  end

end
