class SearchesController < ApplicationController

  def index
    uri = HTTParty.get"https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=AIzaSyDLoUrEVNMmog_PAzs81jFwtEjcXQzO-K4&part=snippet,statistics"
    @youtube = JSON.parse(uri.body)
  end

end

