class TweetDecorator

  def self.collection(tweets)
    tweets.collect{|tweet| self.new(tweet) }
  end

  def initialize(tweet)
    @tweet = tweet
  end

  def text
    text = @tweet.text
    text = text.gsub(/@([\w_]+)/, '<a href="/timeline/\1">@\1</a>')
    text = text.gsub(/\n/, '<br />')
    text
  end

  def created_at
    @tweet.created_at.strftime('%b %e, %l:%M %p')
  end

end