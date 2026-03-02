class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: true

  def client
    TwitterClient.new(self)
  end
end
