class HomeController < ApplicationController
  def index
  end

  def timeline_redirect
    redirect_to "/timeline/#{params[:username]}"
  end
end
