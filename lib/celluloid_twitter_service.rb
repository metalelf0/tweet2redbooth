require 'celluloid/autostart'

class CelluloidTwitterService
  include Celluloid

  attr_accessor :keywords, :client, :user

  def initialize user, keywords
    @user     = user
    @keywords = keywords
    @client   = nil
  end

  def start
    client   = TweetStream::Client.new
    client.track(*keywords) do |tweet, client_control|
      user.tweet_events.create(
        tweeter: tweet.attrs[:user][:screen_name],
        text:    tweet.text
      )
      client_control.stop if should_stop?
    end
  end

  def should_stop?
    user.client_control_events.size > 0 && user.client_control_events.last.stop?
  end
end
# service = CelluloidTwitterService.new(%w(world war hiphop rap), 1)
# Celluloid::Actor['service'] = service; 
# service.async.start
