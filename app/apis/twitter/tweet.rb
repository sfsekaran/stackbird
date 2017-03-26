class Twitter::Tweet

  def initialize(hash)
    @data = hash
  end

  def text
    @data['retweeted_status'] && @data['retweeted_status']['full_text'] || @data['full_text']
  end

  def created_at
    DateTime.parse(@data['created_at'])
  end

end
