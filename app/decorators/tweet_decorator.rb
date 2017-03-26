class TweetDecorator

  def self.collection(tweets)
    tweets.collect{|tweet| self.new(tweet) }
  end

  def initialize(tweet)
    @tweet = tweet
  end

  def text
    @tweet.text
  end

  def created_at
    @tweet.created_at.strftime('%b %e, %l:%M %p')
  end

end