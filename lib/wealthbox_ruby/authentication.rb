module Wealthbox
  module Authentication
    def self.included(base)
        base.extend(ClassMethods)
      end

    def refresh_access_token!
      raise ArgumentError, 'Refresh token required.' unless @refresh_token

      params = {
        headers: {
          'Accept' => 'application/json'
        },
        body: {
          grant_type: 'refresh_token',
          client_id: Wealthbox.config.client_id,
          client_secret: Wealthbox.config.client_secret,
          refresh_token: @refresh_token
        }
      }

      response = handle_response(HTTParty.post("#{@api_endpoint}/#{Wealthbox.config.token_path}", params))

      {
        oauth_token: response[:access_token],
        refresh_token: response[:refresh_token]
      }
    end

    module ClassMethods
      def create_api_token(username:,password:)
        HTTParty.post("#{Wealthbox.config.api_endpoint}/authentication", body: {
          email: username,
          password: password
        })
      end
    end
  end
end