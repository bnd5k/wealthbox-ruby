module WealthboxRuby
  class Client
    include WealthboxRuby::Connection
    include WealthboxRuby::Authentication
    include WealthboxRuby::Client::Portfolios
    include WealthboxRuby::Client::Clients

    def initialize(options =  {})
      raise ArgumentError, 'token required' unless options[:token]

      @api_endpoint = options[:api_endpoint] || WealthboxRuby.config.api_endpoint
      @token = options[:token]
      @refresh_token = options[:refresh_token]
    end
  end
end