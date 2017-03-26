class TimelineController < ApplicationController
  def show
    @handle = params[:id]
    t = Twitter.new
    @tweets = t.timeline(@handle)
  end
end
