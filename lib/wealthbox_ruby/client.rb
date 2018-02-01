module WealthboxRuby
  class Client
    include WealthboxRuby::Connection
    include WealthboxRuby::Authentication
    include WealthboxRuby::Client::Contacts

    def initialize(options =  {})
      raise ArgumentError, 'Access token required' unless options[:access_token]

      @api_endpoint = options[:api_endpoint] || WealthboxRuby.config.api_endpoint
      @access_token = options[:access_token]
      @refresh_token = options[:refresh_token]
    end
  end
end