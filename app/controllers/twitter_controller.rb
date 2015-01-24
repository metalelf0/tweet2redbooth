class TwitterController < ApplicationController

  def index
    @latest_tweets = TweetEvent.last(10)
  end

  def start
    # Temporary version - this will fetch 10 tweets including "Juventus"
    Resque.enqueue(TwitterJob, "Juventus")
    flash[:notice] = "Service started, fetching 10 Juventus-related tweets..."
    redirect_to :root
  end

  def stop
    # pending
  end
end
