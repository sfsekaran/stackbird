class TimelineController < ApplicationController
  def show
    @handle = params[:id]
  end
end
