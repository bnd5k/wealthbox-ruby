require 'httparty'
require 'virtus'

require 'wealthbox_ruby/version'
require 'wealthbox_ruby/errors'
require 'wealthbox_ruby/connection'
require 'wealthbox_ruby/authentication'
require 'wealthbox_ruby/models/base'
require 'wealthbox_ruby/models/api_model'
require 'wealthbox_ruby/models/data_model'
require 'wealthbox_ruby/models/analysis'
require 'wealthbox_ruby/models/allocation'
require 'wealthbox_ruby/models/account'
require 'wealthbox_ruby/models/portfolio'
require 'wealthbox_ruby/models/client'
require 'wealthbox_ruby/client/portfolios'
require 'wealthbox_ruby/client/clients'
require 'wealthbox_ruby/client'

module Wealthbox
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
      @api_endpoint = 'https://api2.riskalyze.com/ap/v1'
      @token_path = "/oauthpro/token"
    end
  end
end
