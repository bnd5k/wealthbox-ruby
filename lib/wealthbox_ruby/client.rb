module Wealthbox
  class Client
    include Wealthbox::Connection
    include Wealthbox::Authentication
    include Wealthbox::Client::Portfolios
    include Wealthbox::Client::Clients

    def initialize(options =  {})
      raise ArgumentError, 'oauth_token required' unless options[:oauth_token]

      @api_endpoint = options[:api_endpoint] || Wealthbox.config.api_endpoint
      @oauth_token = options[:oauth_token]
      @refresh_token = options[:refresh_token]
    end
  end
end