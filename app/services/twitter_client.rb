require "net/http"
require "uri"
require "json"

class TwitterClient
  def initialize(twitter_account)
    @twitter_account = twitter_account
  end

  def post_tweet(text)
    uri = URI("https://api.twitter.com/2/tweets")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {
      "Authorization" => "Bearer #{@twitter_account.token}",
      "Content-Type" => "application/json"
    })

    request.body = { text: text }.to_json

    response = http.request(request)
    JSON.parse(response.body)
  end
end