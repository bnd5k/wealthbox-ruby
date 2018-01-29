require 'httparty'
require 'virtus'

require_relative 'wealthbox_ruby/version'
require_relative 'wealthbox_ruby/errors'
require_relative 'wealthbox_ruby/connection'
require_relative 'wealthbox_ruby/authentication'
require_relative 'wealthbox_ruby/models/base'
require_relative 'wealthbox_ruby/models/api_model'
require_relative 'wealthbox_ruby/models/data_model'
require_relative 'wealthbox_ruby/models/analysis'
require_relative 'wealthbox_ruby/models/allocation'
require_relative 'wealthbox_ruby/models/account'
require_relative 'wealthbox_ruby/models/portfolio'
require_relative 'wealthbox_ruby/models/client'
require_relative 'wealthbox_ruby/client/portfolios'
require_relative 'wealthbox_ruby/client/clients'
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
    attr_accessor :client_id, :client_secret, :api_endpoint, :token_path

    def initialize
      @api_endpoint = 'https://api.crmworkspace.com/v1/'
      @token_path = "/oauthpro/token"
    end
  end
end
