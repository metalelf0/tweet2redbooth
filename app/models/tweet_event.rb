class TweetEvent < ActiveRecord::Base

  def self.create_from_tweet tweet
    screen_name =  tweet.attrs[:user][:screen_name]
    text        =  tweet.text
    TweetEvent.create(user: screen_name, text: text)
  end
end
