require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Twitter2 < OmniAuth::Strategies::OAuth2
      option :name, 'twitter2'

      option :client_options, {
        site: 'https://api.twitter.com',
        authorize_url: 'https://twitter.com/i/oauth2/authorize',
        token_url: 'https://api.twitter.com/2/oauth2/token'
      }

      option :authorize_options, [:scope]

      uid { raw_info['data']['id'] }

      info do
        {
          name: raw_info['data']['name'],
          username: raw_info['data']['username']
        }
      end

      def raw_info
        @raw_info ||= access_token.get(
          'https://api.twitter.com/2/users/me',
          params: { 'user.fields': 'id,name,username' }
        ).parsed
      end
    end
  end
end
