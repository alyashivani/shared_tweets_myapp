class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  after_save_commit do
    if publish_at_previously_changed?
      TweetJob.set(wait_until: publish_at).perform_later(self)
    end
  end

  def published?
    tweet_id?
  end

  def publish_to_twitter!
    client = twitter_account.client
    response = client.post_tweet(body)
    if response["data"]
      tweet_id = response["data"]["id"]
      update(tweet_id: response["data"]["id"])
      puts "Tweet ID: #{tweet_id}"
    else
      puts response # shows error
    end
  end
end