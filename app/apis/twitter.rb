require 'http'
require 'base64'

class Twitter
  BASE_URL = "https://api.twitter.com".freeze
  CONSUMER_KEY = "h152rpScvPt8b2mvF9oAVEBFs".freeze
  CONSUMER_SECRET = "FQnxzMPSWKkrVCu7tXAgjNA3ZCC80F3HEZezzkG5NxGGROEet0".freeze

  def timeline(username)
    options = { count: 25, screen_name: username, tweet_mode: :extended }
    raw_data = api_request('/1.1/statuses/user_timeline.json', options)
    raw_data.collect{|datum| Twitter::Tweet.new(datum) }
  end

  def api_request(path, options={})
    Rails.cache.fetch("twitter-api:#{path}:#{options.to_json}", expires_in: 5.minutes) do
      headers = { 'Authorization' => "Bearer #{bearer_token}" }
      response = HTTP.headers(headers).get("#{BASE_URL}#{path}", params: options)
      response.parse
    end
  end

  def bearer_token
    @bearer_token ||= retrieve_bearer_token
  end

  def retrieve_bearer_token
    headers = { content_type: 'application/x-www-form-urlencoded;charset=UTF-8', user_agent: 'Stackbird v0.0' }
    form = { grant_type: 'client_credentials' }
    response = HTTP.basic_auth(user: CONSUMER_KEY, pass: CONSUMER_SECRET).
                    headers(headers).
                    post('https://api.twitter.com/oauth2/token', form: form)
    response.parse['access_token']
  end

end
