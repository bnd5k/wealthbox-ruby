module WealthboxRuby
  class Client
    include WealthboxRuby::Connection
    include WealthboxRuby::Authentication
    include WealthboxRuby::Client::Contacts
    include WealthboxRuby::Client::Events
    include WealthboxRuby::Client::Notes
    include WealthboxRuby::Client::Opportunities
    include WealthboxRuby::Client::Tasks
    include WealthboxRuby::Client::Workflows

    def initialize(options =  {})
      raise ArgumentError, 'API key or OAuth token required.' unless options[:api_key] || options[:oauth_token]

      @api_endpoint = options[:api_endpoint] || WealthboxRuby.config.api_endpoint
      @api_key = options[:api_key]
      @oauth_token = options[:oauth_token]
      @refresh_token = options[:refresh_token]
    end
  end
end
