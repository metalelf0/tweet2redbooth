class TwitterController < ApplicationController

  def index
    @latest_tweets = TweetEvent.all.limit(10)
  end

  def start
    # Temporary version - this will fetch 10 tweets including "Juventus"
    Resque.enqueue(TwitterJob, "Juventus")
    redirect_to :root
  end

  def stop
    # pending
  end
end
