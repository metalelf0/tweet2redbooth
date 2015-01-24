class TwitterService

  attr_accessor :keywords

  def initialize keywords
    @keywords = keywords
  end

  def start
    @count = 0
    client = TweetStream::Client.new
    client.track(*@keywords) do |tweet, client_control|
      TweetEvent.create_from_tweet(tweet)
      @count += 1
      client_control.stop if @count >= 10
    end
  end
end
