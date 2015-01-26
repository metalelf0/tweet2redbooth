class AddUserIdToTweetEvent < ActiveRecord::Migration
  def change
    add_column :tweet_events, :user_id, :integer
    add_index :tweet_events, :user_id
  end
end
