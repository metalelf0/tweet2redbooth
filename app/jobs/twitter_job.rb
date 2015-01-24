class TwitterJob
  @queue = :twitter

  def self.perform keywords
    TwitterService.new(keywords).start
  end
end
