# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter2, Rails.application.credentials.dig(:twitter, :consumer_key), 
#   Rails.application.credentials.dig(:twitter, :secret_key), 
#   scope: "tweet.read users.read offline.access"
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2,
           Rails.application.credentials.dig(:twitter, :client_id),
           Rails.application.credentials.dig(:twitter, :client_secret),
           callback_path: '/auth/twitter2/callback',
           scope: "tweet.read tweet.write users.read offline.access"
end

OmniAuth.config.allowed_request_methods = [:post]
OmniAuth.config.silence_get_warning = true
