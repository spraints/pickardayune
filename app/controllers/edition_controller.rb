class EditionController < ApplicationController
  def index
    date = Date.new params[:year].to_i, params[:month].to_i, 1
    @date = date.strftime '%B %Y'
    @stories = Story.for_edition(date)
  end

  def current
    now = Time.now
    redirect_to edition_path(now.year, now.month)
  end

  def feed
    @stories = Story.for_feed
  end
end
