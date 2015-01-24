class CreateTweetEvents < ActiveRecord::Migration
  def change
    create_table :tweet_events do |t|
      t.string :text
      t.string :user
      t.string :keyword

      t.timestamps null: false
    end
  end
end
