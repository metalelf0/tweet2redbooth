class RenameTweetEventUserToTweeter < ActiveRecord::Migration
  def change
    rename_column :tweet_events, :user, :tweeter
  end
end
