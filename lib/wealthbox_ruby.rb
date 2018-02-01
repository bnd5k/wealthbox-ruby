require 'httparty'
require 'virtus'

require_relative 'wealthbox_ruby/version'
require_relative 'wealthbox_ruby/errors'
require_relative 'wealthbox_ruby/connection'
require_relative 'wealthbox_ruby/authentication'
require_relative 'wealthbox_ruby/models/base'
require_relative 'wealthbox_ruby/models/api_model'
require_relative 'wealthbox_ruby/models/household'
require_relative 'wealthbox_ruby/models/contact'
require_relative 'wealthbox_ruby/client/contacts'
require_relative 'wealthbox_ruby/client'

module WealthboxRuby
  class << self
    attr_accessor :config

    def config
      @configuration ||= Configuration.new
    end

    def configure
      yield config
    end
  end

  class Configuration
    attr_accessor :client_id, :client_secret, :api_endpoint, :token_url

    def initialize
      @api_endpoint = 'https://api.crmworkspace.com/v1/'
      @token_url = "https://app.crmworkspace.com/oauth/token"
    end
  end
end
