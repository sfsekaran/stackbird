class TimelineController < ApplicationController
  before_action :require_login

  def show
    @handle = params[:id]
    t = Twitter.new
    @tweets = t.timeline(@handle)
    @tweets = TweetDecorator.collection(@tweets)
  end
end
